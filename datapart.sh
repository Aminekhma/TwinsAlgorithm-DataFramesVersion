yourfilenames=`ls $1`
start=`date +%s.%N`

a=1
for eachfile in $yourfilenames
do 
    echo $a" : Done for "$eachfile
    awk '{ print $1" "$2" "int($3/300) }' $1$eachfile | sort -rn -k3 | uniq > $2$eachfile
    a=$((a+1))
done

end=`date +%s.%N`

echo "$end - $start" | bc -l

# 901.854871700 seconde //// 15 min 1 sec for 700 files
