#
# Run_codeml.sh
#

# ----------------------------------
cd ./Testdata

mkdir codeml_${GeneID}

cp -a ./codeml/* ./codeml_${GeneID}
cp  ./AlignmentPrep/MAFFT_linsi/Codon/${GeneID}.codon ./codeml_${GeneID}
cd ./codeml_${GeneID}

mv ./${GeneID}.codon ./Ortho.codon

echo 1rate 2rate Free-rate | xargs -n 1 cp -v Ortho.codon

# please check the diferences among ".tree" files, and among ".ctl" files in 1rate and 2rate directories.

#### run codeml for one-omega model

pwd
# pelase confirm that you are in codeml_${GeneID} directory

# run codeml for both models at one slurm script
cd 1rate 
${dNdS_Dir}/Tools/paml4.8/codeml codeml_01.ctl

cd ../2rate
${dNdS_Dir}/Tools/paml4.8/codeml codeml_02.ctl

cd ../Free-rate
${dNdS_Dir}/Tools/paml4.8/codeml codeml_03.ctl
#codeml_loop.sh  -l aln.list -t temp.tree  -c codeml_frW.ctl -o  freeW
#codeml_loop.sh  -l aln.list -t 1w.tree    -c codeml_1W.ctl  -o  1W
#codeml_loop.sh  -l aln.list -t 2w.tree    -c codeml_2W.ctl  -o  2W
cd ${dNdS_Dir}

#EOF