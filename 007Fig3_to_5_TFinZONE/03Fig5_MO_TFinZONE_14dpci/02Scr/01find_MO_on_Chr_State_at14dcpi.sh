#conda activate my_env

SI=500
SI2=200
CO=16
RA=30000
LE=8
NAME="CORR1_14d"
mkdir MO_PERAME
############## group 1   #############
PP=..
for (( i = 0; i <= 4; i++ ))
 do
for R1 in $PP/01DATA_ORI/14d*/0${i}*_14dcpi_forMOTIF.bed
do
yolo=$(echo "$R1" | rev | cut -c 5- | rev)
yolob=$(echo "$R1" | rev | cut -c 13- | rev)
yolob1=$(echo "$R1" | rev | cut -c 14- | rev)
yolo1=$(echo "$yolo" | cut -c 30- )
yolo2=$(echo "$yolob" |  cut -c 30- )
for MM in $PP/01DATA_ORI/14d*/0${i}*_mask_500/knownResults/*.txt
do
mkdir ${R1%/*}/08MO_on_PEAKS
yolo3=$(echo "$MM" | rev | cut -c 5- | rev)
yolo4=$(echo "$yolo3" | cut -c 89- )

echo "$MM2"
echo "findMotifsGenome.pl $R1 danRer11 ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`mask_500_FIND -size $SI -len 8 -h -mask  -p $CO -cache $RA -find $MM "
echo "findMotifsGenome.pl $R1 danRer11 ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`mask_500_FIND -size $SI -len 8 -h -mask  -p $CO -cache $RA -find $MM > ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`mask_500_FIND/`basename $yolob``basename $yolo3`.txt"

findMotifsGenome.pl $R1 danRer11 ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`_mask_500_FIND -size $SI -len 8 -h -mask  -p $CO -cache $RA -find $MM 
findMotifsGenome.pl $R1 danRer11 ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`_mask_500_FIND -size $SI -len 8 -h -mask  -p $CO -cache $RA -find $MM > ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`_mask_500_FIND/`basename $yolob``basename $yolo3`.txt
mv ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`_mask_500_FIND/motifFindingParameters.txt ./MO_PERAME/`basename $yolob1`_motifFindingParameters.txt

find ${R1%/*}/08MO_on_PEAKS/`basename $yolob1`_mask_500_FIND/ -type f -name "*.txt" -size -400c -delete

done 
done

done 


