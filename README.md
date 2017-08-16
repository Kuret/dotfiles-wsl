# Dotfiles

This repo contains my dotfiles and an install script, which will install:
- Tmux
- Xclip
- Neovim + Plugins
- Zsh + Antigen
- Stow (to symlink dotfiles)
- Redis
- Node.js + NPM
- PostgreSQL
- Rbenv + Ruby-build
- Ruby 2.4.0
- Ruby gems: Bundler + Foreman + Rails 5.0.1
- Elixir + Phoenix

# Arch setup

Requirements before running the script:
- Locale set (LANG, LANGUAGE, LC_ALL, etc)
- Git
- Yaourt

# Running the script

The script requires root and will ask for the root password by itself, **don't start the script as root, use your normal user**

```
cd ~
git clone git@github.com:Kuret/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

# Hyper-V

When running Arch in Hyper-V, following steps are needed to SHH into it properly:
- In Hyper-V create a Virtual Switch -> External switch bound to internet-connected network adapter on host
- Install Arch as normal
- Install required packages

   `sudo pacman -S openssh samba`

- Edit samba config to SSH by hostname

  `sudo nano /etc/samba/smb.conf`

  Add/edit the following lines

    ```
    workgroup = WORKGROUP
    netbios name = <your-host-name>
    ```
- Enable and start services

  ```
  systemctl enable sshd
  systemctl start sshd
  systemctl enable smbd.service
  systemctl start smbd.service
  systemctl enable nmbd.service
  systemctl start nmbd.service
  ```
  
- Edit/uncomment sections in `/etc/ssh/sshd_config`
  
  ```
  PubkeyAuthentication yes
  RSAAuthentication yes
  ```
  
- Cygwin

   Install Cygwin + openssh

  In cygwin: `ssh -t rsa`
  
  Copy the `id_rsa.pub` content to the Arch's .ssh/authorized_keys
  
# Git config

  ```
  git config --global color.ui true
  git config --global user.name "GITHUB USERNAME"
  git config --global user.email "GITHUB EMAIL"
  ssh-keygen -t rsa -b 4096 -C "GITHUB EMAIL"
  ```
  
  `cat ~/.ssh/id_rsa.pub`, paste key into Github account > SSH Keys
  
  `ssh -T git@github.com` to verify ssh connection
