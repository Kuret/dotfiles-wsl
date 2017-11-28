# Dotfiles

This repo contains my dotfiles and an install script for Ubuntu on Windows Subsystem for Linux, which will install:
- Common build/development packages
- Tmux
- Zsh + Zplug
- Stow (to symlink dotfiles)
- Silver searcher (ag)
- Neovim + Plugins
- ImageMagick
- Yarn
- Nginx
- Redis
- PostgreSQL (Client only, see below)
- Erlang/OTP20
- Asdf version manager with Node/Ruby/Elixir plugins
- Ruby gems: Bundler/Foreman/Rails
- Elixir mix: Hex/Phoenix

# Running the script

The script requires root and will ask for the root password by itself, **don't start the script as root, use your normal user**

```
cd ~
git clone git@github.com:Kuret/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

# Manually

- Install GNU Stow using your package manager
- Install whatever packages you need
- Use `stow` to symlink the dotfiles

# Permissions

**This isn't needed if you already have a user you can `sudo` with**

- Add your user to the 'wheel' group

   `sudo usermod -G wheel USERNAME`
   
- Uncomment the relevant line in your sudoers file

   `%wheel  ALL=(ALL) ALL`
   
   Or with NOPASSWD if you don't want to require a password
   
   `%wheel  ALL=(ALL) NOPASSWD: ALL`

# Windows Subsystem For Linux Setup

Activate the WSL in windows:
- Make sure you are running a Windows 10 build with Windows Store support for WSL (build 16215+)
- Open powershell as administrator and run command

   `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
   
- Go to the Windows store and install the package `Ubuntu`
- Run the user setup and set your username and passwords
- Set up an X-Server (VcXsrv) 
- If using a terminal emulator I would highly recommend https://github.com/mintty/wsltty or alternatively Hyperterm

# Open links on the Windows host

The `bin` folder contains the script `wsl-browser-bridge` which opens links on the Windows host, which does several things:
- If the supplied path is not found on the client it will assume it is an URL and passes it to the host
- If the supplied path starts with the `/mnt/c/` it will replace that with `C:/`
- If the supplied path starts with anything else (like `/home/username`) it will try to copy the file/folder referenced in the path to `C:/temp/` and pass the path to the host
- Set the `BROWSER` environment variable to `wsl-browser-bridge` to set the client's default browser to this script

_Beware when trying to open a file in a big folder, it will try to copy over the whole thing to the Windows side._

# Connecting to PostgreSQL on the Windows host

On the Windows side, before running the script:
- Install PostgreSQL on Windows however you like
- Make sure the credentials are the defaults (postgres/postgres)
- Obviously don't use these in a production setup

**Steps below should automatically be done by the install script, don't run if the 'psql' command succeeds**
For easy cross platform connection in a dev setup:
- Make a superuser with the same username as your linux user
- Make a default database with the same name as your linux user
- In your .bashrc/.zshrc add the following: `export PGHOST=localhost`
- You should be able to connect using just the command `psql` now

# Git config

  ```
  git config --global color.ui true
  git config --global user.name "GITHUB USERNAME"
  git config --global user.email "GITHUB EMAIL"
  ssh-keygen -t rsa -b 4096 -C "GITHUB EMAIL"
  ```
  
  `cat ~/.ssh/id_rsa.pub`, paste key into Github account > SSH Keys
  
  `ssh -T git@github.com` to verify ssh connection

# Issues
- I'm sure there are, tell me.
