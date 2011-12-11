#!/bin/bash
passB="./data/sw0174-h13-d0-"
passA="0001"
kaku=".csv"
dat=".dat"
#echo $passB
# input file number
echo 'Please input minimum file number (ex.03)!'
read fnumin
echo 'Please input maximum file number (ex.05)!'
read fnumax
delta=`expr $fnumax - $fnumin`
#echo "delta="
#echo $delta
cnt=0
while [ "$cnt" -le "$delta" ]
do
	#echo "cnt="
	#echo $cnt
	fpass=$passB$fnumin$passA$kaku
	cvtfout=$pass$fnumin$passApr$dat
	cvtf=$passB$fnumin$passA$dat	
	cut -d ',' -f 4,5,11,12 $fpass > $cvtf
	echo "reading... "$fpass
	cat $cvtf | sed -e 's/,/ /g' > $cvtfout
	mv $cvtfout $cvtf
	echo "outputing... "$cvtf
	cnt=`expr $cnt + 1`
	fnumin=`expr $fnumin + 1`
	if [ "$fnumin" -lt 10 ]
	then
		fnumin=0$fnumin
	fi
	#echo "$fnumin="
	#echo $fnumin
done
