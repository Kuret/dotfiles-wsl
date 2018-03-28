if [ ! "$(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/p')" = "Microsoft"  ]; then
  exit 0
fi

refresh_ps_path="\$env:Path = [System.Environment]::GetEnvironmentVariable('Path','User'); \
                 \$env:PGDATA = [System.Environment]::GetEnvironmentVariable('PGDATA','User');"

# PostgresQL
# 
# autostart for Linux psql
#$(pgrep postgres > /dev/null 2>&1) || sudo service postgresql start > /dev/null 2>&1
# autostart for WSL psql
#powershell.exe -Command "pg_ctl start" > /dev/null 2>&1
$(psql -l > /dev/null 2>&1) || powershell.exe -Command "$refresh_ps_path pg_ctl start" > /dev/null
export PGHOST=localhost

# Keybase
$(pgrep keybase > /dev/null 2>&1) || run_keybase > /dev/null 2>&1

# Set default shell
export SHELL=/usr/bin/zsh

# Set default browser to Opera on Windows
export BROWSER="wsl-browser-bridge"

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Set display for XServer
export DISPLAY=localhost:0

# Link to Windows commands
function scoop() {
 powershell.exe -Command "scoop $*"
}

alias pgs='powershell.exe -Command "$refresh_ps_path pg_ctl start"'
alias pgx='powershell.exe -Command "$refresh_ps_path pg_ctl stop"'
alias chromedriver='powershell.exe -Command "$refresh_ps_path chromedriver"'
