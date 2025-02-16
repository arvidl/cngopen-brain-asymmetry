#! /bin/sh
# this is a universal ICBM processing script
echo This script will assemble the date from VOXEL_X_Y_Z into X Y Z H2r P format

if [ $# -ne 1 ]
then
        echo $1
        echo Give the name for the output file e.g. brain.txt
        exit
fi


# don't modify after this line

pheno_list=`find . -type d -name "node*"`

# Lets make solar_run file

echo node","name","H2r","rp >> $1

for cur_dir  in  $pheno_list
do
echo $cur_dir

XX=`echo $cur_dir | awk -F "_" '{print $2}'`
echo $XX

X=`echo $cur_dir`
echo $X

line=`more $cur_dir/polygenic.out | grep "H2r is"`
H2r=`echo $line |  awk '{print $3}'`
echo $H2r

rp=`echo $line |  awk '{print $6}'`
echo $rp

echo se $se $cur_dir/polygenic.out

echo $XX","$X","$H2r","$rp >> $1



done
