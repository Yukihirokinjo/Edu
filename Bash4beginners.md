# Technical summary of dN/dS course (for how to work in Linux/Unix environment)

Ver. 0.1
For the students at OIST.  

>**NOTICE:** This is for Linux or Unix (MacOS) operating system. Almost all the techniques below cannot be applied to Windows system. At OIST, OS of Deigo is a Red-had linux (CentOS). Thus, for Windows users, these lectures will be helpful when you use Deigo.

--------------------------------------------------------------------------------
## Chapter 1: Path (full/relative path)
A "path" is a location to an object (file or a directory) in a filesystem. A path is comprised of names of directories and the separator "/".

###Full path
A location of an object from the root directory `/` is referred to as "full path" (or "absolute path"). A typical example of the full paths in a Linux system is shown in Figure 1.
  
![FullPath](https://user-images.githubusercontent.com/6457769/124109624-51fca100-daa2-11eb-939b-6f45f767a08b.png)
  
You can see where you are working at by `pwd` command. The full path provided by `pwd` command is referred to as "current directory" (or "present working directory"). You can change your current directory using `cd` command. For example, suppose you are in home directory, and then you can move to the Desktop (located under the home directory) by typing

```bash
cd /home/yourUserName/Desktop
```  

###Relative path
"Relative path" is the location relative to the current directory. Relative path to the current directory is `./`, and to the directory contains current directory (referred to as "parent directory") is `../`, and to the directory contains the parent directory is `../../`.
Figure 2 shows a typical example of the relative paths. Note that relative path will be changed every time you change your current directory as they are "relative" to the current directory. You can use a relative path as an argument to `cd` command.
  
![RelativePath](https://user-images.githubusercontent.com/6457769/124109523-31344b80-daa2-11eb-9b73-16701c8e9ce0.png)

--------------------------------------------------------------------------------
## Chapter 2: Variables in Linux(Unix)

A variable is a character string to which we assign a value. The value assigned could be a number, text, filename, device, or any other type of data. There are two types of variable in Linux/Unix operating system: environmental (or global) variables and local variables.

###Name of variables
The name of a variable must be comprised of alphabetical characters (a to z or A to Z), and/or numbers (0 to 9) or underscore `_`. Numbers cannot be at the first place.  
Examples of valid variable names:
```
Hensu
HENSU1
hensu_2
_HENSU3
```
Examples of valid variable names:
```
1Hensu
-HENSU
hensu/
!HENSU3
```
By convention, name of variables are defined in capital letters. 

###Defining and accessing variables
To define a variable, you can use `=` between the variable and a value. The value can be charactors, numbers, or a path. The variable to be defined must be left side and the value must be right side. Note that there must be "no space" between the variable, `=`, and value (i.e. the structure must be `variable=value`).
For example,
```bash
Namae=Kinjo
Aisatsu="Kon-nichi World"
```
Double (or single) quotes are not necessary if the value does not contain space. 
  
To access the value defined on the variable, you can put `$` symbol before the name of the variable. For example, suppose you defined a variable `TENKI`  as below
```bash
TENKI="Typhoon des yo"
```
to see the content of a variable `TENKI`, 
```bash
echo $TENKI
```
or, the name of variable can be inserted between `{}`
```bash
echo ${TENKI}
```
This form is better than simply putting `$`. You will see the reason why `${Var}` is better than `$Var` in an advanced lecture here (under prep.).
  

###Environment (global) and local variables
In Linux/Unix operating system, there are two types of variables.

####Local variable
Almost all cases you use a variable should be local variable. A local variable is defined by the user and is valid only in the current session (the terminal you are working at), not valid in the script files and other sessions (terminals) even if you are working at the same directory.
  
####Environment (global) variables
An environment (or global) variables are pre-defined (default) variables which are always valid in any places in the "environment". On of the most frequently used environment variable is `HOME`, which contains the path to your home directory (thus, it differ among users).  
Regarding `HOME` environment variable, the three commands below are equivalent.

```bash
cd ${HOME}
cd ~/
cd
``` 
> `~/` is a short cut of the path to the home directory, and the default behavior of `cd` command is to move to home directory.
  
Another frequently used environment variable is `PATH`. 

--------------------------------------------------------------------------------
## Chapter 3: PATH environment variable

The $PATH environmental variable is a colon-delimited list of paths to the directories containing executable files to be searched by the system. Generally, you have to type full path to the executable file or script when you invoke it, however, it will be no need when the path to the directory containing the executable file or script is already listed in the `PATH`.

To add a directory to `PATH`, you can choose either one of the followings:

#### 1. using export command 
Simply type
```bash
export PATH=$PATH:/path/to/the/directory/containing/the/program
```
This will work, however, the new PATH is available only in the terminal you typed the command above.


#### 2. adding the setting of PATH onto `~/.bashrc` file   
To avid typing the same command every time you invoke the shell, we can use `.bashrc` file. `.bashrc` file is a file storing environmental settings in your local system, and is loaded (read) by the system every time you invoke the shell (i.e. open a terminal or login to the system). The `.bashrc` file is generally located under your home directory as a hidden file (starting from ".").  
To add a setting to the `.bashrc` file, you can type
```bash
echo 'export PATH=$PATH:/path/to/the/directory/containing/the/program' >> ~/.bashrc
```
or directly write the command in `.bashrc` file by using a text editor.
  
To activate the additional setting, type

```bash
source ~/.bashrc
```

The command above is needed only at the first time after you modified `.bashrc`, you don't need to type this for the next time you login to the shell.

>**IMPORTANT NOTE:** Please do not forget to put "$PATH:" before the directory path(s), otherwise you are going to destroy all the default PATH information, and then many default commands (such as ls, cd, cp, etc..) will be not available, though you can use them by specifying their absolute path (e.g. type "/usr/bin/ls" insterd of "ls").
  
--------------------------------------------------------------------------------
## Chapter 4: Compiling and installing a program

Programs written in a compiled language (e.g. C/C++, Java, Fortran) need to be compiled. Compiling is the transformation from "source code" (human readable) into "binary file" (computer executable). Source code(s) are generally located in the directory `src`.

In case of C/C++, typical procedure to compile a program is as follows.
If there is no `Makefile` but there is `configure` file,
```bash
./configure
make
make install
```

or, if `Makefile` already exists,
```bash
make
make install
```

Here, `make install` does system installation, which requires root permission (i.e. system administrator). Thus, you can do `make install` in your computer, but you cannot do that in the other environment, such as Deigo, as it requires root permission.
In case you are in the other environment, you can do "local install" instead of "system install". For example, if you have already created "bin" directory under your home directory (i.e. `~/bin`), and assuming that you already added `~/bin` directory to `PATH` (see Chapter 3).
```bash
cp  relative/path/to/binary/file(s)  ~/bin
```
or
```bash
ln -s /full/path/to/binary/file(s)  ~/bin
```
The first command makes a copy of the binary file at `~/bin` directory, while second one makes "symbolic link" (like a shortcut file in Windows) at `~/bin` directory. Note that `ln -s` command requires absolute path.
  
--------------------------------------------------------------------------------
## Chapter 5: Decompression and compression of files 

In Linux and MacOS(sometime referred to as UNIX) There are several commands to compress or decompress files. This time, we used `.zip` and `.tgz`(equivalent with `.tar.gz`).

###zip
By using `zip` command, you can do both file compression and archiving.   
For example, to compress three files `file1 file2 file3` into a `xxx.zip` file,
```bash
zip  xxx.zip  file1 file2 file3
```
Or if you want to compress a directory,
```bash
zip  -r  xxx.zip  directory1
```
To decompress a `.zip` file, 
```bash
unzip xxx.zip
```

###gzip
`gzip` command is used to compress a single file. Unlike `zip`, `gzip` does not have function for archiving files, and `gzip` cannot be applied to a directory. 
For example, to compress a file into a `.gzip` file,
```bash
zgip  file1
```
To decompress a `.gzip` file,
```bash
gunzip  xxx.gzip
```

###tar
The GNU `tar` is used to make an archive file from multiple files. Although `tar` itself does not have the function for compression, you can do `gzip` compression together with tar by using `-z` option. `tar` (with `-z` option) can compress files into slightly smaller size than `zip`. While `zip` is suitable for Windows or MacOS, `tar` would be suitable for Linux OSs.   
For example, to compress three files into `xxx.tar.gz`,
```bash
tar  -zcvf  xxx.tar.gz  file1 file2 file3
```
Here, `-` before `zxvf` is not necessary.  
To decompress a `.tar.gz` file,
```bash
tar  -zxvf xxx.tar.gz
```
  
For more details, please see the link below.  
https://www.cyberciti.biz/howto/question/general/compress-file-unix-linux-cheat-sheet.php

--------------------------------------------------------------------------------
## Chapter 6: File transfer via ssh (scp command)

For the file transfer via ssh, please see the link below.  
https://groups.oist.jp/scs/copy-and-move-data
  
--------------------------------------------------------------------------------
## Chapter 7: File permission
When you receive some files from someone or download file from somewhere, sometime you may be unable to access, execute, or modify the files. In most cases, such problems are due to the permission of the files. When you face such problems, you can check the permission of the files by using `ls` command with `-l` option. If you are the owner of the files, you can change their permission by using `chmod` command.  
For the details, please go to the link below.  
https://linuxcommand.org/lc3_lts0090.php
  
--------------------------------------------------------------------------------
## Other basic Linux commands 

Please go to the link below.  
https://groups.oist.jp/scs/basic-linux-commands
  
--------------------------------------------------------------------------------
## Useful terminal shortcuts
If you don't know so much about the terminal shortcuts, you should check  
https://www.redhat.com/sysadmin/top-10-shortcuts
  
--------------------------------------------------------------------------------
## Advanced lectures
Coming soon.  
