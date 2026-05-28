#!/usr/bin/env sh
# shellcheck shell=sh
# https://get.korat.ai/install.sh — sourced from
# https://github.com/korat-ai/korat-mcp-hub/blob/HEAD/scripts/install.sh
#
# One-line install for Korat CLI:
#   curl -fsSL https://get.korat.ai/install.sh | sh
#
# Environment overrides (all optional):
#   KORAT_VERSION      Tag to install, e.g. v0.1.0. Default: latest
#   KORAT_INSTALL_DIR  Where to put the binary. Default: ~/.korat/bin
#
# The script:
#   1. Detects OS + architecture.
#   2. Resolves the exact release version (follows GitHub's well-known
#      redirect — no GitHub API call, avoiding the 60 req/hr anon rate limit).
#   3. Downloads korat-cli-<version>-<platform>.tar.gz + SHA256SUMS.
#   4. Verifies SHA-256 (mandatory; no skip path).
#   5. Extracts the binary to KORAT_INSTALL_DIR and renames to "korat".
#   6. On macOS: strips the com.apple.quarantine xattr so Gatekeeper is happy.
#   7. Prints a PATH hint.

set -eu

KORAT_VERSION="${KORAT_VERSION:-latest}"
KORAT_INSTALL_DIR="${KORAT_INSTALL_DIR:-$HOME/.korat/bin}"

# ── Platform detection ────────────────────────────────────────────────────────

SYS="$(uname -s)"
ARCH="$(uname -m)"

case "${SYS}/${ARCH}" in
  Darwin/arm64)   PLATFORM="darwin-arm64" ;;
  Darwin/x86_64)  PLATFORM="darwin-x64"   ;;
  Linux/x86_64)   PLATFORM="linux-x64"    ;;
  Linux/aarch64)  PLATFORM="linux-arm64"  ;;
  *)
    printf 'Unsupported platform: %s %s. See https://github.com/korat-ai/korat-mcp-hub/releases for available builds.\n' \
      "${SYS}" "${ARCH}" >&2
    exit 1
    ;;
esac

# ── SHA-256 helper ────────────────────────────────────────────────────────────

sha256_file() {
  # Usage: sha256_file <path>
  # Prints the hex digest of the file, or exits 1 if no sha tool is available.
  if command -v sha256sum > /dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  elif command -v shasum > /dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  else
    printf 'No SHA-256 tool found (tried sha256sum, shasum). Please install one and retry.\n' >&2
    exit 1
  fi
}

# ── Temp dir + cleanup ────────────────────────────────────────────────────────

TMPDIR_KORAT="$(mktemp -d)"
# shellcheck disable=SC2329  # invoked via trap, not a direct call
cleanup() {
  rm -rf "${TMPDIR_KORAT}"
}
trap cleanup EXIT

# ── Resolve concrete version ──────────────────────────────────────────────────
# GitHub releases/<version>/download/<asset> requires an exact version in the
# asset filename. For VERSION=latest we follow the well-known /latest/download
# redirect to discover the concrete tag, rather than calling the GitHub API.

if [ "${KORAT_VERSION}" = "latest" ]; then
  printf 'Resolving latest version...\n'
  RESOLVED_VERSION="$(curl -fsSLI -o /dev/null -w '%{url_effective}' \
    'https://github.com/korat-ai/korat-mcp-hub/releases/latest/download/SHA256SUMS' \
    | sed -nE 's|.*/releases/download/(v[^/]+)/SHA256SUMS|\1|p')"
  if [ -z "${RESOLVED_VERSION}" ]; then
    printf 'Could not resolve latest version from GitHub redirect.\n' >&2
    exit 1
  fi
  printf '  -> %s\n' "${RESOLVED_VERSION}"
else
  RESOLVED_VERSION="${KORAT_VERSION}"
fi

ASSET="korat-cli-${RESOLVED_VERSION}-${PLATFORM}.tar.gz"
BASE="https://github.com/korat-ai/korat-mcp-hub/releases/download/${RESOLVED_VERSION}"

# ── Download ──────────────────────────────────────────────────────────────────

printf 'Downloading %s...\n' "${ASSET}"
curl -fsSL "${BASE}/${ASSET}"     -o "${TMPDIR_KORAT}/${ASSET}"
curl -fsSL "${BASE}/SHA256SUMS"   -o "${TMPDIR_KORAT}/SHA256SUMS"

# ── Verify SHA-256 ────────────────────────────────────────────────────────────

printf 'Verifying SHA-256...\n'

EXPECTED="$(grep " ${ASSET}\$" "${TMPDIR_KORAT}/SHA256SUMS" | awk '{print $1}')"
if [ -z "${EXPECTED}" ]; then
  printf 'SHA256SUMS does not contain an entry for %s\n' "${ASSET}" >&2
  exit 1
fi

ACTUAL="$(sha256_file "${TMPDIR_KORAT}/${ASSET}")"

if [ "${EXPECTED}" != "${ACTUAL}" ]; then
  printf 'SHA-256 mismatch!\n  expected: %s\n  actual:   %s\n' \
    "${EXPECTED}" "${ACTUAL}" >&2
  exit 1
fi
printf '  OK (%s)\n' "${EXPECTED}"

# ── Extract + install ─────────────────────────────────────────────────────────

printf 'Installing to %s...\n' "${KORAT_INSTALL_DIR}"
mkdir -p "${KORAT_INSTALL_DIR}"
tar -xzf "${TMPDIR_KORAT}/${ASSET}" -C "${KORAT_INSTALL_DIR}"
mv "${KORAT_INSTALL_DIR}/Korat.Cli" "${KORAT_INSTALL_DIR}/korat"
chmod +x "${KORAT_INSTALL_DIR}/korat"

# On macOS, remove the quarantine xattr set by curl so Gatekeeper doesn't
# block the first run. 2>/dev/null silences "no such xattr" on clean downloads.
if [ "${SYS}" = "Darwin" ]; then
  xattr -d com.apple.quarantine "${KORAT_INSTALL_DIR}/korat" 2>/dev/null || true
fi

# ── Done — print PATH hint ────────────────────────────────────────────────────

printf '\nInstalled korat to %s\n' "${KORAT_INSTALL_DIR}/korat"
printf 'Add it to your PATH:\n'
# shellcheck disable=SC2016  # $HOME is intentionally unexpanded — we are printing a shell snippet
printf '  echo '\''export PATH="$HOME/.korat/bin:$PATH"'\'' >> ~/.zshrc\n'
printf '\nThen reopen your shell and run: korat version\n'

exit 0
