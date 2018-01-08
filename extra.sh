# Fetch and rebase local branches off master branch
frb() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	echo "\e[34mSetting current branch to $source_branch\e[31m"

	git remote -v
	read -p "Remote to rebase from: " myRemote
	git fetch $myRemote
	git checkout master
	git pull --rebase upstream master
	git checkout dev
	git pull --rebase upstream dev
	git checkout qa
	git pull --rebase upstream qa
	git checkout release
	git pull --rebase upstream release

	git checkout $source_branch
}

# Reset all local dev branches
greset() {
	source_branch=$(git symbolic-ref --short -q HEAD)
	echo "\e[34mSetting current branch to $source_branch\e[31m"

	git remote -v
	read -p "Remote to rebase from: " myRemote
	git fetch $myRemote
	git checkout master
	git reset --hard upstream/master
	git checkout dev
	git reset --hard upstream/dev
	git checkout qa
	git reset --hard upstream/qa
	git checkout release
	git reset --hard upstream/release
}