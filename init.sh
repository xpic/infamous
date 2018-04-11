echo "Setting the password for the root"
passwd root
adduser guest
echo "Setting the password for the guest account"
read pswd
passwd guest 
echo "Guest password initialized to $pswd"
cp .bash_alias .bash_export .bash_history .bash_login .bash_logout .bash_profile .bashrc .emacs .gitignore .gitconfig .logo .logo2 .logo3 .zshrc ~Tensorflow ~/
apt-get install -y make cmake screenfetch tree ssh python pyton-pip subversion git emacs24 telegram-cli fish zsh g++ gcc gdb openjdk-8-jdk vim 
pip install sklearn matplotlib jupyter scipy virtualenv
cp sudoers /etc/sudoers #Attention Dangereux configurer le mot de passe du root avant
#Packages
