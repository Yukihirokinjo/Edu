#
# InstallonMac.bash
#

cd dNdS_Practice3

dNdS_Dir=$(pwd)

cd Tools
######### Mafft
# download pkg file from 
# https://mafft.cbrc.jp/alignment/software/mafft-7.453-signed.pkg
# double click mafft-7.453-signed.pkg and follow installer's instructions. 
# or
# download source code file from 
# https://mafft.cbrc.jp/alignment/software/mafft-7.453-without-extensions-src.tgz
tar zxvf mafft-7.453-without-extensions-src.tgz
cd mafft-7.453-without-extensions/core
make
cd ../../

######### pal2nal.pl
# download compressed file from
# http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz
tar zxvf pal2nal.v14.tar.gz

######### Gblocks

# uncompress Gblocks_OS_0.91b.tar.Z
tar xvf Gblocks_OSX_0.91b.tar

######### codeml
# paml4.8a.macosx.tgz

tar zxvf paml4.8a.macosx.tgz
cd paml4.8/src
make -f Makefile  # maybe you need to install Xcode app.
mv baseml basemlg codeml pamp evolver yn00 chi2 ..

cd ${dNdS_Dir}

#EOF