# navigate
alias l='ls -lah'
alias zsh_restart="exec zsh"
alias zz="vs_open ~/.zshrc"

# apps
alias ii_open="open -a \"Intellij Idea\""
alias py_open="open -a \"PyCharm\""
alias vs_open="open -a \"Visual Studio Code\""
alias ws_open="open -a \"WebStorm\""

# git
git_finish_branch(){
	branch=$(git_current_branch)
	gcm
	ggl
	gf --prune
	if [ $branch != "main" ] && [ $branch != "master" ]; then
		gbD $branch
	fi
}
alias git_add_ssh="ssh-add --apple-use-keychain ~/.ssh/id_ssh_github_2"
alias git_my_refs="git for-each-ref --format=' %(authorname) %09 %(refname)' --sort=authorname | grep Bondarev"

# Other
alias gpg_restart="echo \"test\" | gpg --clearsign"
