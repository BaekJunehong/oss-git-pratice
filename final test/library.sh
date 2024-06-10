dir=$( dirname "$(readlink -f "${BASH_SOURCE[0]}")" )
. ${dir}/inpath
. ${dir}/validint
. ${dir}/valid-date

#. `dirname "$(readlink -f "${BASH_SOURCE[0]}")"`/inpath