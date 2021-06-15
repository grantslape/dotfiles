# Fetch and rebase local branches off master branch
function frb() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	echo "\e[34mSetting current branch to $source_branch\e[37m"

	git remote -v
	echo "Remote to rebase from: "
	read -n myRemote
	git stash
	git fetch $myRemote
	git checkout master
	git pull --rebase $myRemote master
	git checkout dev
	git pull --rebase $myRemote dev
	git checkout qa
	git pull --rebase $myRemote qa

	git checkout $source_branch
	git stash pop
}

# Reset all local dev branches
function greset() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	echo "\e[34mSetting current branch to $source_branch\e[37m"
	qa="env/qa"
	dev="env/dev"

	git remote -v
	echo "Remote to rebase from: "
	read -n myRemote
	git stash
	git fetch $myRemote
	git checkout master
	git reset --hard $myRemote/master
	git checkout $dev
	git reset --hard $myRemote/$dev
	git checkout $qa
	git reset --hard $myRemote/$qa

	git checkout $source_branch
	git stash pop
}

function av() {
	aws-vault login $1
}

# login to aws vault
# usage: av <PROFILE>
# ex: av ts-staff
function avs() {
	aws-vault login $1 -s | pbcopy
}

# aws-vault exec cmd
# usage: ave <PROFILE> <COMMAND>
# ex: ave ts-staff make deploy
function ave() {
	aws-vault exec $1 -- ${@:2}
}

# init terraform and apply
# usage: tfa <PROFILE>
#ex: tfa devops-staff
function tfa() {
	ave $1 terraform init
	ave $1 terraform apply
}
function tfa13() {
	ave $1 /usr/local/bin/terraform0.13 init
	ave $1 /usr/local/bin/terraform0.13-beta3 apply
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

# git status
function gs() {
	git status
}

# Composer for Favor
export COMPOSER_AUTH=$(cat ~/.composer/auth.json)
