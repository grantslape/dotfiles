# Reset all local dev branches
function gdel() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	git branch | grep -v "main\$" | grep -v "$source_branch\$" | xargs git branch -D
}

function c() {
	code $1
}

# install precommit
function pci() {
	pre-commit install
	pre-commit install --hook-type pre-push
	pre-commit install --hook-type commit-msg
}

# Sign
function sign() {
	# Sign the key
    gpg --sign-key $1
    # Export the newly signed key
    FILE="${1}-signed-by-$(whoami).asc"
    gpg --armor --export $1 > $FILE
    echo "Saved ${FILE}"
}

# Reset GPG if issues occur
gpg-reset() {
  if [[ "$(killall -s gpg-agent 2>&1)" == "kill"* ]]; then
    sudo killall gpg-agent
  fi
  gpg-agent --homedir ${HOME}/.gnupg --daemon --enable-ssh-support
  gpg --card-status
  export "GPG_TTY=$(tty)"
  export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"
}
