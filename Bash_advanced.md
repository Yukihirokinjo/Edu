# advanced lectures

## How to write a bash script 
```bash
Hensu=piyopiyo
echo ${Hensu}
```
The output of the command above is
```
piyopiyo
```
  
Then, you may think that this variable can be used in the script you run. If you made a script like below
```bash Hiyoko.bash
#!/bin/bash
echo ${Hensu}
```
The variable `Hensu` in the script file is completely different from the variable `Hensu` defined in the command line.
```bash
Hensu=piyopiyo
bash ./Hiyoko.bash
```
This does not output anything. To obtain the same output with the previous commands, you should mod the script as below
```bash Hiyoko.bash
#!/bin/bash
Hensu=piyopiyo
echo ${Hensu}
```

