#conda activate my_env
###	background is a subset of all non significant genes (up and down-subset not included)
#####	peak called with pvalue 1e5 ##################
PP=..
SI=500
LE=8
for (( i = 0; i <= 4; i++ ))
do
for R1 in $PP/01DATA_ORI/04d*/0${i}*_04dcpi_forMOTIF.bed
do
yolo=$(echo "$R1" | rev | cut -c 5- | rev)
yolo1=$(echo "$yolo" | cut -c 20- )
yolob=$(echo "$R1" | rev | cut -c 14- | rev)
yolo2=$(echo "$yolo1" | rev | cut -c 5- | rev)
#echo "findMotifsGenome.pl $R1 danRer11  ${R1%/*}/`basename $yolob`_mask_500 -size $SI -len 8 -h -mask"
#echo "findMotifsGenome.pl $R1 danRer11 ${R1%/*}/${yolo}_mask_500 -size $SI -len $LE -h -mask"
findMotifsGenome.pl $R1 danRer11 ${R1%/*}/`basename $yolob`_mask_500 -size $SI -len 8 -h -mask


done 

for R1 in $PP/01DATA_ORI/04*/0${i}*_mask_500/knownResults/known*.motif 
 do
yolo=$(echo "$R1" | rev | cut -c 7- | rev)
yolo1=$(echo "$R1" | rev | cut -c 14- | rev)
echo "${R1%/*}"
head -1 $R1 | sed 's/(/\t/g' - |  awk  '{gsub("/","\t",$0); print$2;}' - > ${yolo} 
head -1 $R1 | sed 's/(/\t/g' - |  awk  '{gsub("/","\t",$0); print$2;}' - |  awk 'FNR == 1 {print $1}' > ${yolo}_A 
paste $R1 ${yolo} > ${yolo}_edit_NAME
mv ${yolo}_edit_NAME ${R1%/*}/`cat ${yolo}_A`.txt
rm ${yolo}_A 
rm ${yolo} 
done 
done 
