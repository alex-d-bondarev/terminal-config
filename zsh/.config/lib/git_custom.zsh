git_finish_branch(){
	branch=$(git_current_branch)
	gcm
	ggl
	gf --prune
	if [ $branch != "main" ] && [ $branch != "master" ]; then
		gbD $branch
	fi
}
alias git_add_ssh="ssh-add --apple-use-keychain ~/.ssh/id_ssh_github_2022"
alias git_my_refs="git for-each-ref --format=' %(authorname) %09 %(refname)' --sort=authorname | grep Bondarev"
