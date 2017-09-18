export NIX=nix-env
export NIXSTORE=nix-store

function nix {
  if (( $# == 0 )) then
    echo "usage: nix <command> <options>"
    echo "nix -s [arguments]       |  search for packages"
    echo "nix -i [arguments]       |  install packages"
    echo "nix -c <days, optional>  |  clean packages more than <days> ago. Default is 5 days"
    echo "nix -ca                  |  clean all packages"
  fi

  if [[ $1 == "-s" ]] then
    shift
    nix-s "$@"
  elif [[ $1 == "-i" ]] then
    shift
    nix-i "$@"
  elif [[ $1 == "-c" ]] then
    shift
    nix-c "$@"
  elif [[ $1 == "-ca" ]] then
    nix-ca
  fi
}

function __vnix {
  
}

function nix-s {
  if (( $# == 0 )) then
    echo "no search paramter was given"
  else
    SEARCH_CMD="nix-env -qaP | grep"
    for var in "$@"
    do
      SEARCH_CMD="$SEARCH_CMD -e $var"
    done 

    eval $SEARCH_CMD
  fi
}

function nix-i {
  if (( $# == 0 )) then
    echo "no package name was given"
  else
    INSTALL_CMD="nix-env -i $@"
    eval $INSTALL_CMD
  fi
}

function nix-c {
  if [[ -z $1 ]] then
    days=5
  else
    days=$1
  fi

  CLEAN_CMD="nix-env --delete-generations ${days}d && nix-store --gc"
  eval $CLEAN_CMD
}

function nix-ca {
  CLEAN_CMD="nix-env --delete-generations old && nix-store --gc"
  eval $CLEAN_CMD
}
