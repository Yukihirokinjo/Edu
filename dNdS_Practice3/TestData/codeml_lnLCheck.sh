#
# codeml_lnLCheck.sh
#

# FreeRate
while read Line; do
  lnL=$(grep lnL $Line | sed 's/lnL(ntime: 16  np: 33): //g' | awk '{print $1}') 
  ID=${Line#*.}
  echo ${ID} ${lnL}	>> lnL.txt
done < out.list

# OneRate
ls | grep mlc > out.list
while read Line; do
  lnL=$(grep lnL $Line | sed 's/lnL(ntime: 16  np: 18): //g' | awk '{print $1}') 
  ID=${Line#*.}
  echo ${ID} ${lnL}	>> lnL.txt
done < out.list

# TwoRate
ls | grep mlc > out.list
while read Line; do
  lnL=$(grep lnL $Line | sed 's/lnL(ntime: 16  np: 19): //g' | awk '{print $1}') 
  ID=${Line#*.}
  echo ${ID} ${lnL}	>> lnL.txt
done < out.list


#EOF