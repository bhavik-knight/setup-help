
###############################################################################
# to force to restart system in boot-menu
# systemctl reboot --firmware-setup
################################################################################


################################################################################
# for lamp-stack
# alias lampstatus="sudo service apache2 status ; sudo service mysql status"
# alias lampstart="sudo service mysql start ; sudo service apache2 start"
# alias lampstop="sudo service mysql stop ; sudo service apache2 stop"
# alias lamprestart="lampstop ; lampstart"
################################################################################

################################################################################
# some more ls aliases
alias ll="ls -lF --group-directories-first"
alias la="ls -lAF"
alias l="ls -CF"
################################################################################


################################################################################
# aliases for terminals
# wezterm
alias wezterm='flatpak run org.wezfurlong.wezterm'
################################################################################


################################################################################
# make python3 the default python
alias python=python3

# make "pywin" command use the latest windows python installtion (v3.9)
# alias pywin="/mnt/c/Program\ Files/Python3*/python.exe"
################################################################################

################################################################################
# invoke MS Word using "word" command
# alias word="/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Office/root/Office16/WINWORD.EXE"
################################################################################

################################################################################
# invoke pycharm using "charm" command
# alias charm="/mnt/c/Program\ Files/JetBrains/PyCharm\ Community\ Edition\ 20*/bin/pycharm64.exe"
alias charm="/snap/bin/pycharm-community . > /dev/null 2>&1 &"
################################################################################

################################################################################
# invoke rstudio using "rstudio" command
# alias rstudio="/mnt/c/Program\ Files/Rstudio/bin/rstudio.exe"
################################################################################

################################################################################
# invoke IntelliJ IDEA using "idea" command
# alias idea="/mnt/c/Program\ Files\ \(x86\)/JetBrains/IntelliJ\ IDEA\ Community\ Edition\ 2020.1/bin/idea64.exe"
alias idea="/snap/bin/intellij-idea-community . > /dev/null 2>&1 &"
################################################################################

################################################################################
# invoke Eclipse using "eclipse" command
alias eclipse="/snap/bin/eclipse . > /dev/null 2>&1 &"
################################################################################

################################################################################
# path variables for cs50
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
# export LDLIBS="-lcrypt -lcs50 -lm"
################################################################################

################################################################################
# path variables for csci162
export CXX="g++"
export CXXFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c++11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
#export CXXFLAGS="-ggdb3 -O0 -std=c++11 -Wall -Werror -Wextra"
################################################################################

################################################################################
# password for SMU Linux server
export SSHPASS="03.neurotic.curable.spoilage"
################################################################################




