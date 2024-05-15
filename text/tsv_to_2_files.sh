file=$1
file1=$2
file3=$3
sed -e "s/$(printf '\011')/__FIRSTSEP__/" <$file | awk -F"__FIRSTSEP__" '{print $1 > $file1 ; print $2>$file3 }'
