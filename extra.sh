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
	git checkout release
	git pull --rebase $myRemote release

	git checkout $source_branch
	git stash pop
}

# Reset all local dev branches
greset() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	echo "\e[34mSetting current branch to $source_branch\e[37m"

	git remote -v
	echo "Remote to rebase from: "
	read -n myRemote
	git stash
	git fetch $myRemote
	git checkout master
	git reset --hard $myRemote/master
	git checkout dev
	git reset --hard $myRemote/dev
	git checkout qa
	git reset --hard $myRemote/qa
	git checkout release
	git reset --hard $myRemote/release

	git checkout $source_branch
	git stash pop
}