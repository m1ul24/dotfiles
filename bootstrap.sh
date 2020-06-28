dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

case "${OSTYPE}" in
  linux*)
    . "${dir}/install_linux.sh"
    . "${dir}/setup_linux.sh"
  ;;
  darwin*)
    . "${dir}/install_macos.sh"
    . "${dir}/setup_macos.sh"
  ;;
esac
