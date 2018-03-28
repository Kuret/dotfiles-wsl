# Dotfiles

This repo contains my dotfiles and install scripts.

Currently made with Debian/Ubuntu on Windows 10 (WSL) in mind.

Supports native Debian/Ubuntu but is untested.

Scripts will install:
- NeoVim + Plugins
- ImageMagick
- Yarn
- Nginx
- Postgresql
- Zsh + Zplug
- Tmux
- Python
- Redis
- Silver Searcher (ag)
- Midnight Commander
- Asdf version manager to manage Ruby and Elixir
- NodeJS
- Ruby
- Erlang
- Elixir

The `install-apt` which is called from the `install` when Debian/Ubuntu is detected will also detect if it is running under WSL.
If so, it will install applications on the Windows side:
- Chromedriver + `chromedriver` command on WSL linking to the .exe (for acceptance tests started from WSL)
- Wsltty + Config + Gruvbox scheme + Shortcut to WSL in Start (Starts tmux with zsh)

# Running the script

The script requires root and will ask for the root password by itself, **don't start the script as root, use your normal user**

```
cd ~
git clone git@github.com:Kuret/dotfiles.git
cd dotfiles
chmod +x install
./install
```

# Permissions

- Script for Debian/Ubuntu will disable password check for `sudo` for the current user,
  if this is not desirable edit `install-apt` and comment out the relevant lines.

# Windows Subsystem For Linux Setup

Activate the WSL in windows:
- Make sure you are running a Windows 10 build with Windows Store support for WSL (build 16215+)
- Open powershell as administrator and run commands

   ```
   Set-ExecutionPolicy RemoteSigned -scope CurrentUser
   iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

   scoop install postgresql
   scoop install chromedriver # if you need it for acceptance tests

   # obviously dont just create passwordless superusers in a production environment
   createuser -s postgres
   createuser -s <your_linux_username>
 
   # start postgresql
   pg_ctl start

   Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
   ```

- Go to the Windows store and install the package `Debian` or `Ubuntu`
- Run the user setup and set your username and passwords
- If using a terminal emulator I would highly recommend https://github.com/mintty/wsltty (installed with the included script)

# Open links on the Windows host

The `bin` folder contains the script `wsl-browser-bridge` which opens links on the Windows host, which does several things:
- If the supplied path is not found on the client it will assume it is an URL and passes it to the host
- If the supplied path starts with the `/mnt/c/` it will replace that with `C:/`
- If the supplied path starts with anything else (like `/home/username`) it will try to copy the file/folder referenced in the path to `C:/temp/` and pass the path to the host
- Set the `BROWSER` environment variable to `wsl-browser-bridge` to set the client's default browser to this script

_Beware when trying to open a file in a big folder, it will try to copy over the whole thing to the Windows side._

# TODO

- Support MacOS: Package list for `homebrew` on MacOS is present but no further work is done there
- Support for more Linux distributions
- Support for BSD's
- Install a session manager, tiling WM and GUI apps when in a non-WSL environment

# Issues
- I'm sure there are, tell me.
