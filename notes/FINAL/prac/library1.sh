var=$( dirname "$(readlink -f "${BASH_SOURCE[0]}")")

. ${var}/validint
. ${var}/inpath
. ${var}/valid-date