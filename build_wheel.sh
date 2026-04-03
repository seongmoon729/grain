#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="${SCRIPT_DIR}"

# If Docker access is denied, run once:
#   sudo usermod -aG docker "$USER"
# Then log out and back in, or use:
#   newgrp docker

cd "$ROOT_DIR"

# Build settings used by Grain's official wheel build scripts.
export PYTHON_VERSION="${PYTHON_VERSION:-3.12}"
export PYTHON_MAJOR_VERSION="${PYTHON_MAJOR_VERSION:-3}"
export PYTHON_MINOR_VERSION="${PYTHON_MINOR_VERSION:-12}"
export BAZEL_VERSION="${BAZEL_VERSION:-7.2.1}"
export SOURCE_DIR="${SOURCE_DIR:-$ROOT_DIR}"
export RUN_TESTS_WITH_BAZEL="${RUN_TESTS_WITH_BAZEL:-false}"
export IS_NIGHTLY="${IS_NIGHTLY:-false}"

sudo -E bash -lc "cd \"${ROOT_DIR}\" && . ./grain/oss/runner_common.sh && build_and_test_grain"