# Fetch and rebase local branches off master branch
frb() {
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
greset() {
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

av() {
	aws-vault login $1
}

# login to aws vault
# usage: av <PROFILE>
# ex: av ts-staff
avs() {
	aws-vault login $1 -s | pbcopy
}

# aws-vault exec cmd
# usage: ave <PROFILE> <COMMAND>
# ex: ave ts-staff make deploy
ave() {
	aws-vault exec $1 -- ${@:2}
}

# Composer for Favor
export COMPOSER_AUTH=$(cat ~/.composer/auth.json)
