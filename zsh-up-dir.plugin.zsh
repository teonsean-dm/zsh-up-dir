PROG='@a = split " "; 
print join " ", @a[0..($#a-1)]; 
if (rindex($a[$#a], "/") != -1) {
  if (scalar @a > 1) { print " "; }
  @b = split "/", $a[$#a];
  print join "/", @b[0..($#b-1)]
}'

function _up-dir {
    if [ -z $BUFFER ]; then
        parent="$(dirname $(pwd))"
        cd $parent
        pwd
    else
        BUFFER=$(echo $BUFFER | perl -ne $PROG)
    fi

}
bindkey "^h" _up-dir
