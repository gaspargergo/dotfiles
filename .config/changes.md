# blacklisting bluetooth, wlan and lte kernel modules
    - placed files in /etc/modprobe.d
    - got the names of the kernel modules which are used with the devices with "lspci -v"

# saving brightness
    - added line in /etc/rc.shutdown to copy brightness from /sys/class/backlight/amdgpu_bl0/brightness to ~/brightness.backup
    - added line in /etc/rc.local to copy the brightness saved at shutdown back to the file in /sys/class/....
    

# tmux with color, italics, and good ncurses
    - set the following things in tmux config file:
    ```
    set -g default-terminal "tmux-256color"

    set -g terminal-overrides "*:colors=256" # force 256 colors
    ```
    - This will make true colors and italics work, however, ncurses will be messy, to fix that:
    ```
    sudo xbps-install ncurses-term
    ```
