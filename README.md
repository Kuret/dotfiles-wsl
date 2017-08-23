# Dotfiles

This repo contains my dotfiles and an install script utilizing the Nix package manager, which will install:
- Nix
- Git
- Tmux
- Neovim + Plugins
- Zsh + Zplug
- Stow (to symlink dotfiles)
- Redis
- Nodejs
- PostgreSQL
- Asdf version manager with Ruby/Erlang/Elixir plugins
- Ruby + Bundler/Foreman/Rails
- Erlang + Elixir

Supported setups when using the install script (for now):
- Windows Subsystem for Linux (Tested on the Windows Store version of OpenSUSE LEAP 42.2)

Untested but likely to work:
- MacOS/OSX
- Any Linux distro that can run the Nix package manager

# Running the script

Requirements before running the script:
- Git

The script requires root and will ask for the root password by itself, **don't start the script as root, use your normal user**

```
cd ~
git clone git@github.com:Kuret/dotfiles.git
cd dotfiles
chmod +x install.sh
./install-nix.sh
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
   
- Go to the Windows store and install the package `OpenSUSE Leap` or `Ubuntu` (Did not verify this script on Ubuntu)
- Run the user setup and set your username and passwords

# Cross platform copy-pasting

For cross platform copy-paste support I use Lemonade: https://github.com/pocke/lemonade
- The install script installs the Linux client
- Download the Windows application from https://github.com/pocke/lemonade/releases
- Unzip the Windows version and put the `lemonade.exe` in a convenient directory
- To run the server open a command prompt and run `lemonade.exe server`
- To send something to the clipboard from Linux run `lemonade copy "YourClipboardText"` or `OutputToPipe | lemonade copy`

Running the server in the background without showing the terminal window:
- Create a file `lemonade.vbs` in a convenient location and put in the following
   ```
   Dim WinScriptHost
   Set WinScriptHost = CreateObject("WScript.Shell")
   WinScriptHost.Run("C:\Workspace\Tools\Lemonade\lemonade.exe server"), 0, true
   Set WinScriptHost = Nothing
   ```
- To run this automatically on startup create a registry key in `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run` with the value `WScript C:\Path\To\lemonade.vbs`

# Open links on the Windows host

The `bin` folder contains the script `wsl-browser-bridge` which opens links on the Windows host, which does several things:
- If the supplied path is not found on the client it will assume it is an URL and passes it to the host
- If the supplied path starts with the `/mnt/c/` it will replace that with `C:/`
- If the supplied path starts with anything else (like `/home/username`) it will try to copy the file referenced in the path to `C:/temp/` and pass the path to the host
- Set the `BROWSER` environment variable to `wsl-browser-bridge` to set the client's default browser to this script

_Please note that this won't work properly for opening folders or when trying to open a .html file on the host with external dependencies (images, javascript etc) since it will only copy the single file that's passed to the command._

# Connecting to PostgreSQL on the Windows host

I recommend running PSQL Portable from Windows: https://github.com/garethflowers/postgresql-portable

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
- Couldn't get Qt5/Qt5Webkit/Qmake to work using Nix, refer to https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit to install it on your OS if stuff fails to build.
