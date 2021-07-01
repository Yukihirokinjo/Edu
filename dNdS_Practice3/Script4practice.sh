##
## codeml practice
##

#srun --partition=compute -t 1-1 --mem=10G -c 2 --x11 --pty bash

############## 0. Import data
cd    # move to the directory contains dNdS_Practice2.tar.gz file

tar zxvf dNdS_Practice3.tar.gz
cd  dNdS_Practice3

dNdS_Dir=$(pwd)

## follow procedures in Install4Mac.sh

cd Testdata

############## 1. Select dataset
GeneID=Ortho_0001.COG2204

## copy .ffn and .faa files and paste them on 
cp ./tempData/${GeneID}.{ffn,faa}  ./AlignmentPrep

############## 2. prep. Alignment files
cd ./AlignmentPrep

## follow procedures in AlignmentPrep.sh 

############## 3. prep. trees (done)

## skip this part

############## 4. run codeml

## follow procedures in Run_codeml.sh 

# ----------------------------------
############## 5. LRT
cd ./testdata/codeml_${GeneID}
# Collect lnLs for each genes for each models
:> lnLs1W.txt
:> lnLs2W.txt
:> lnLsFW.txt

grep "lnL" ./1rate/mlc >> lnLs1W.txt
grep "lnL" ./2rate/mlc >> lnLs2W.txt
grep "lnL" ./Free-rate/mlc >> lnLsFW.txt

# perform LRT aginst model pair (1w vs 2w), then repeat it for all genes.

############# 6. repeat 5steps for three genes


#EOF