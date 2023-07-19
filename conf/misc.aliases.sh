#! bash oh-my-bash.module
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds many useful BASH aliases and save our lives!
#
#  Sections:
#  1.   File and Folder Management
#  2.   Searching
#  3.   Process Management
#  4.   Networking
#  5.   System Operations & Information
#  6.   Date & Time Management
#  7.   Web Development
#  8.   <your_section>
#
#  X.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numFiles='echo $(ls -1 | wc -l)'       # numFiles:     Count of non-hidden files in current dir
alias make1mb='truncate -s 1m ./1MB.dat'     # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='truncate -s 5m ./5MB.dat'     # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='truncate -s 10m ./10MB.dat'  # make10mb:     Creates a file of 10mb size (all zeros)


#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file


#   ---------------------------
#   3.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"


#   ---------------------------
#   4.  NETWORKING
#   ---------------------------

alias netCons='lsof -i'                                   # netCons:      Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P'                   # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'         # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'         # lsockT:       Display only open TCP sockets
alias ipInfo0='ifconfig getpacket en0'                    # ipInfo0:      Get info on connections for en0
alias ipInfo1='ifconfig getpacket en1'                    # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'              # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                        # showBlocked:  All ipfw rules inc/ blocked IPs


#   ---------------------------------------
#   5.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user


#   ---------------------------------------
#   6.  DATE & TIME MANAGEMENT
#   ---------------------------------------

alias bdate="date '+%a, %b %d %Y %T %Z'"
alias cal3='cal -3'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'
alias epochtime='date +%s'
alias mytime='date +%H:%M:%S'
alias secconvert='date -d@1234567890'
alias stamp='date "+%Y%m%d%a%H%M"'
alias timestamp='date "+%Y%m%dT%H%M%S"'
alias today='date +"%A, %B %-d, %Y"'
alias weeknum='date +%V'


#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:       Shows apache error logs

#   ---------------------------------------
#   9.  OTHER ALIASES
#   ---------------------------------------

# Path to bat config
export BAT_CONFIG_PATH="~/.config/bat/config.conf"

# Replace stuff with bat
alias cat='bat '
alias rg='batgrep '
alias man='tldr '

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

#systeminfo
alias probe='sudo -E hw-probe -all -upload'

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing

#pacman unlock
alias unlock='sudo rm /var/lib/pacman/db.lck'

#available free memory
alias free='free -mt'

#continue download
alias wget='wget -c'

#readable output
alias df='df -h'

#userlist
alias userlist='cut -d: -f1 /etc/passwd'

#Pacman for software managment
alias upall='topgrade'
alias search='sudo pacman -Qs'
alias remove='sudo pacman -Rcns'
alias install='sudo pacman -S'
alias linstall='sudo pacman -U '
alias update='sudo pacman -Syyu && flatpak update'
alias clrcache='sudo pacman -Scc'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias akring='sudo pacman -Sy archlinux-keyring --noconfirm'

# Paru/Yay stuff
alias pget='paru -S '
alias yget='yay -S '
alias yrem='yay -R '
alias prem='paru -R '

#Bash aliases
alias mkfile='touch'
alias jctl='journalctl -p 3 -xb'
alias breload='cd ~ && source ~/.bashrc'
alias zreload='cd ~ && source ~/.zshrc'
alias pingme='ping -c64 github.com'
alias cls='clear && neofetch'
alias traceme='traceroute github.com'

#hardware info --short
alias hw='hwinfo --short'

## HBlock
alias ublock='sudo hblock'

#youtube-dl
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#GiT  command
alias gcl='git clone '
alias gpl='git pull'

#Copy/Remove files/dirs
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scpd='sudo cp -R'

#nano
alias nz='$EDITOR ~/.zshrc'
alias nbashrc='sudo nano ~/.bashrc'
alias nzshrc='sudo nano ~/.zshrc'
alias nsddm='sudo nano /etc/sddm.conf'
alias pconf='sudo nano /etc/pacman.conf'
alias mkpkg='sudo nano /etc/makepkg.conf'
alias ngrub='sudo nano /etc/default/grub'
alias smbconf='sudo nano /etc/samba/smb.conf'
alias nlightdm='sudo $EDITOR /etc/lightdm/lightdm.conf'
alias nmirrorlist='sudo nano /etc/pacman.d/mirrorlist'
alias nsddmk='sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf'

#cd/ aliases
alias home='cd ~'
alias etc='cd /etc/'
alias music='cd ~/Music'
alias vids='cd ~/Videos'
alias conf='cd ~/.config'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'

#verify signature for isos
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'

#receive the key of a developer
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Package Info
alias info='sudo pacman -Si '
alias infox='sudo pacman -Sii '

##Refresh Keys
alias rkeys='sudo pacman-key --refresh-keys'

### HBLOCK Stuff

alias block="sudo hblock"
alias unhblock="hblock -S none -D none"

#shutdown or reboot
alias sr='sudo reboot'
alias ssn='sudo shutdown now'
