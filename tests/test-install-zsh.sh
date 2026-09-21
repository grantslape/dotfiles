#!/usr/bin/env bash

set -euo pipefail

repo_root="${1:?repository root is required}"
installer_under_test="${INSTALLER_UNDER_TEST:-${repo_root}/install}"
test_dir="$(mktemp -d)"
trap 'rm -rf "${test_dir}"' EXIT

test_repo="${test_dir}/repo"
cp -R "${repo_root}" "${test_repo}"
cp "${installer_under_test}" "${test_repo}/install"

mkdir "${test_dir}/bin"
printf '#!/usr/bin/env sh\nexit 0\n' > "${test_dir}/bin/git"
printf '#!/usr/bin/env sh\n[ "$#" -eq 4 ]\n' > "${test_repo}/dotbot/bin/dotbot"
chmod +x "${test_dir}/bin/git" "${test_repo}/dotbot/bin/dotbot"

for shell in bash zsh; do
  PATH="${test_dir}/bin:${PATH}" "${shell}" "${test_repo}/install"
done
