set +x
#     --- All rights reserved -- ©Xavier Pic 2017-2027 ---
echo -e "\033[1;37m*** © Xavier Pic (~xpic) ***\n\033[00m"
if fgrep -xq `whoami` ~xpic/.white_list ; then
#    cat ~xpic/.logo
    neofetch --ascii_colors 1 7 3 4 5 6 --source ~xpic/.logo3
    echo -e "\033[1;37m\n\nBonjour `whoami`!! Bienvenue sur `hostname`!\033[00m\n"
    case $- in
	*i*) ;;
	*) return;;
    esac
    HISTCONTROL=ignoreboth
    shopt -s histappend
    HISTSIZE=1000
    HISTFILESIZE=2000                                                                                 
    shopt -s histverify 
    shopt -s checkwinsize
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
    fi
    case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
    esac
    if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	    color_prompt=yes
	else
	    color_prompt=
	fi
    fi
    export rouge=$'\e[1;31m'
    export jaune=$'\e[1;33m'
    export vert=$'\e[1;32m'
    reset_color=$'\e[m'
    #SVNP_HUGE_REPO_EXCLUDE_PATH="nufw-svn$|/tags$|/branches$"
    . /bin/subversion-prompt
    parse_svn_branch() {
	  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (~svn/\033[01;32m{'$(parse_svn_repository_root)'\033[01;35m"$1"\033[01;32m}::['$(parse_svn_rev)']\033[01;35m) "}'
    }
    parse_svn_url() {
	svn info 2>/dev/null | sed -ne 's#^URL: ##p'
    }
    parse_svn_repository_root() {
	svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
    }
    parse_svn_rev(){
	svn info 2>/dev/null | sed -ne 's#^Revision: ##p'
    }
    export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
    if [ `whoami` = root ]; then
	PS4='\033[1;31m\$++\033[00m '
	PS3="$rouge\$?> $reset_color"
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;31m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;31m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\]$(__git_ps1)$(parse_svn_branch)\[\033[01;31m\]\$\n>\[\033[00m\] '
    elif [ `whoami` = xpic ];then
	PS4='\033[1;33m\$++\033[00m '
	PS3="$jaune\$?>$reset_color " 
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;33m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;33m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\] $(__git_ps1)$(parse_svn_branch)\[\033[01;33m\]\$\n>\[\033[00m\] '
    else
	PS4='\033[1;34m\$++\033[00m '
	PS3="$vert\$?>$reset_color "
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;34m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;32m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\]$(__git_ps1)$(parse_svn_branch) \[\033[01;32m\]\$\n>\[\033[00m\] '
    fi
    export PS4
    export PS3
    unset color_prompt force_color_prompt
    case "$TERM" in
	xterm*|rxvt*)
	    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	    ;;
	*)
	    ;;
    esac
    source ~/.bash_alias
    export PATH=$PATH:/opt/racket/6.7/bin/

    if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
    fi
    if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
	    . /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
	fi
    fi
else
    echo -ne "\033[01;31mVous n'êtes pas autorisés à exécuter ce fichier.\n\033[01;37mVeuillez me contacter pour obtenir les droits.\n\033[0m"
    touch ~xpic/.unauthorized_logs/`whoami`
fi
