# shell
alias l='ls -lah'
alias zsh_restart="exec zsh"
alias zz="vs_open ~/.zshrc"

# apps
alias ii_open="open -a \"Intellij Idea\""
alias py_open="open -a \"PyCharm\""
alias vs_open="open -a \"Visual Studio Code\""
alias ws_open="open -a \"WebStorm\""

# Other
gpg_restart(){
	echo "Restarting gpg..."
	gpgconf --kill gpg-agent
	gpgconf --launch gpg-agent
	echo "gpg restarted"
}
