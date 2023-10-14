# cloned repos directories
export gitdir=$HOME/git
export shdir2=$gitdir/bash-utils
export pwbdir=$gitdir/pwbot
# other code directories
export codedir=$HOME/code
export shdir=$codedir/shell

# custom color scheme for terminal (Debian)
export custom_ps1='\[\033[36m\]\u\[\033[97m\]@\[\033[36m\]\h \[\033[97m\]\W \[\033[36m\]\$\[\033[97m\] '

# aliases for files and directories
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias chrw='chmod u+rw'
alias chrwx='chmod u+rwx'
# aliases for Pywikibot
alias pwb='python $pwbdir/pwb.py'
alias lsp='pwb listpages -format:3'
# miscellaneous aliases
alias curlw='curl -w "\n%{http_code}\n"'
alias ffhb='ffmpeg -hide_banner'
alias ytdl='yt-dlp'
alias ytdlk='yt-dlp -k'

# aliases for Debian-based distros
alias python='python3'
alias pip='pip3'

# directories added to PATH
export PATH=$shdir2:$PATH
export PATH=$shdir:$PATH

