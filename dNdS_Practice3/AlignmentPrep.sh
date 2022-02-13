#
# Alignment prep script
#

pwd    # confirm you are in ~/dNdS_Practice3/AlignmentPrep

################### Obtain list of genes
#num_aln=`ls -l Ortho_*.faa | wc -l`
ls | grep faa$ > seq4aln.list

# Gblock can not accept too long sequence name (>50?)
mkdir ./MAFFT_linsi

################### Align protein sequences
while read Line ; do
  ALNname=${Line%.faa}
  mafft-linsi --amino   $ALNname.faa >  ./MAFFT_linsi/$ALNname.fasta
  ${dNdS_Dir}/Tools/Gblocks_0.91b/Gblocks ./MAFFT_linsi/$ALNname.fasta -t=p
done < seq4aln.list

cd ./MAFFT_linsi  # AlignmentPrep/MAFFT_linsi/

mkdir ./GbHTML
mkdir ./GblockPro
mv ./*.htm  ./GbHTML  # move redundant files
mv ./*gb  ./GblockPro # move redundant files

  # AlignmentPrep/MAFFT_linsi/

################### Align protein sequences based on the protein alignments
# codon
mkdir ./Codon

  while read Line ;do
    ALNname=${Line%.faa}
    ${dNdS_Dir}/Tools/pal2nal.v14/pal2nal.pl   ./$ALNname.fasta  ../$ALNname.ffn -output fasta -codontable $gCode -nogap > ./Codon/$ALNname.codon
    #Gblocks ./Codon/$ALNname.codon -t=c
  done < ../seq4aln.list

  cd ./Codon    # now you should be at  AlignmentPrep/MAFFT_linsi/Codon/

cd ${dNdS_Dir}

# concatenate alignments
#  perl $(which FASconCAT-G_v1.04.pl) -s
#  cp FcC_supermatrix.fas ${CurDir}/${out_dir_name}_Tree/Conc_gblockAln.codon

#EOF