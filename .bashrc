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
    SVNP_HUGE_REPO_EXCLUDE_PATH="nufw-svn$|/tags$|/branches$"
    . /bin/subversion-prompt
    export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
    if [ `whoami` = root ]; then
	PS4='\033[1;31m\$++\033[00m '
	PS3="$rouge\$?> $reset_color"
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;31m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;31m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\]$(__git_ps1) \[\033[01;31m\]\$\n>\[\033[00m\] '
    elif [ `whoami` = xpic ];then
	PS4='\033[1;33m\$++\033[00m '
	PS3="$jaune\$?>$reset_color " 
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;33m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;33m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\]$(__git_ps1)$(__svn_stat) \[\033[01;33m\]\$\n>\[\033[00m\] '
    else
	PS4='\033[1;34m\$++\033[00m '
	PS3="$vert\$?>$reset_color "
	PS2='${debian_chroot:+($debian_chroot)}\[\033[1;34m\]\$ >\[\033[00m\] ' 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[01;32m\] : \[\033[01;31m\]{ \w }\[\033[01;35m\]$(__git_ps1) \[\033[01;32m\]\$\n>\[\033[00m\] '
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
    if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto --group-directories-first --human-readable'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias ls='ls --color=auto'
    fi
    
    LS_COLORS='rs=0:di=01;34:ln=01;36:mh=33:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=01;34;42:ow=01;34;41:st=1;32;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'                                                               
    export LS_COLORS                                                                                    
    
    function clr {                                                                                      
	clear                                                                         
    }                                                                                                   
    function md (){                                                                                     
	mkdir -p -- "$1" && cd -P -- "$1"                                                               
    }                                                                                                   
    function cdl {                                                                                      
	cd $1 && ls                                                                                      
    }                                                                                                   
    function cleantex {                                                                                
	rm -vf $1.aux $1.log $1.out $1.bbl $1.toc $1.lof $1.lot $1.snm $1.nav $1.vrb $1.blg   
    }

    function em {
	emacs -bg dark -fg light -nw $1
    }
    function cdl {
	cd $1 && ls --color=auto --group-directories-first
    }
    alias tf='source ~/~Tensorflow/bin/activate'
    alias l='ls --group-directories-first'                                                                                
    alias ll='l -lh'                                                          
    alias lll='l -lha'                                                                       
    alias tre='tree -RC'                                                                                                    
    alias c='cdl'                                                                                       
    alias em="emacs -fs -nw -bg black"                                                                  
    alias orthographe="aspell -t check --lang=fr"                                                       
    alias sb="set +x; source ~/.bashrc"
    alias eb="em ~/.bashrc"
    alias ecole='ssh ecole'
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
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
