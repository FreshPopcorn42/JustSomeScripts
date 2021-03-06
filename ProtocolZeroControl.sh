#!/bin/bash

#Might be helpful:
#https://stackoverflow.com/questions/24574159/difference-between-alias-rm-and-bin-rm
#https://unix.stackexchange.com/questions/74213/how-to-change-rm-to-as-a-command-like-mv-trash
#https://www.linuxquestions.org/questions/linux-newbie-8/how-to-modify-rm-command-815581/

#https://www.youtube.com/results?search_query=make+recovery+image+linux
#https://www.youtube.com/results?search_query=system+image+backup+linux
#SUDO ALIAS
#https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo

"alias sudo='sudo '" >> ~/.bashrc

whatToDoe = $1

if [$whatToDoe == "-r"]
then
	ProtocolZero -r
elif [$whatToDoe == "-u"]
then
	ProtocolZero -u
elif [$whatToDoe == "-w"]
then
	ProtocolZero -w
fi


#Else: Make new script

> /sbin/ProtocolZero.sh

OneMore = 0
x = ''

#Set questions/answers

'#Set questions/answers' >> /sbin/ProtocolZero.sh
while [$Onemore >= 0]
do
	$x = '	' * $OneMore
	$OneMore = $OneMore + 1
	echo Question number $OneMore
	read question
	ech Answer number $OneMore
	read answer

	$x = '	' * $OneMore

	$x + 'echo $question' >> /sbin/ProtocolZero.sh
	$x + 'read model' >> /sbin/ProtocolZero.sh
	'\n' >> /sbin/ProtocolZero.sh
	$x + 'if [$model == $answer]' >> /sbin/ProtocolZero.sh
	$x + 'then' >> /sbin/ProtocolZero.sh
done


#End ifs

'#End ifs/add elses' >> /sbin/ProtocolZero.sh
for i in ($OneMore)
do
$x = $x - '	'
x + 'else' >> /sbin/ProtocolZero.sh
$x = $x + '	'
x + 'echo Sorry bro' >> /sbin/ProtocolZero.sh
$x = $x - '	'
x + 'fi' >> /sbin/ProtocolZero.sh
done

$x = '	'

'else' >> /sbin/ProtocolZero.sh
x + 'echo Sorry bro' >> /sbin/ProtocolZero.sh
'fi' >> /sbin/ProtocolZero.sh

#Make 'delete system' to ProtocolZero
#1
alias rm -rf /="/sbin/ProtocolZero"
'alias rm -rf /="/sbin/ProtocolZero"' >> ~/.bashrc
alias rm -f /="/sbin/ProtocolZero"
'alias rm -f /="/sbin/ProtocolZero"' >> ~/.bashrc
alias rm -r /="/sbin/ProtocolZero"
'alias rm -r /="/sbin/ProtocolZero"' >> ~/.bashrc
alias rm /="/sbin/ProtocolZero"
'alias rm /="/sbin/ProtocolZero"' >> ~/.bashrc


#2
alias unalias rm -rf /='ProtocolZeroControl -w'
'alias unalias rm -rf /="ProtocolZeroControl -w"' >> ~/.bashrc


#2
alias unalias rm -f /*='ProtocolZeroControl -w'
'alias unalias sudo rm -f /*="ProtocolZeroControl -w"' >> ~/.bashrc

#3
alias unalias rm -r /='ProtocolZeroControl -w'
'alias unalias rm -r /="ProtocolZeroControl -w"' >> ~/.bashrc

#3
alias unalias rm -r /*='ProtocolZeroControl -w'
'alias unalias rm -r /*="ProtocolZeroControl -w"' >> ~/.bashrc


#4
alias unalias rm /='ProtocolZeroControl -w'
'alias unalias  rm /="ProtocolZeroControl -w"' >> ~/.bashrc

#4
alias unalias rm /*='ProtocolZeroControl -w'
'alias unalias rm /*="ProtocolZeroControl -w"' >> ~/.bashrc

#5
alias ProtocolZero='ProtocolZeroControl -w'
alias /sbin/ProtocolZero='ProtocolZeroControl -w'
alias /bin/ProtocolZero='ProtocolZeroControl -w'
alias ./ProtocolZero='ProtocolZeroControl -w'

#5
alias ProtocolZero='ProtocolZeroControl -w' >> ~/.bashrc
alias /sbin/ProtocolZero='ProtocolZeroControl -w' >> ~/.bashrc
alias /bin/ProtocolZero='ProtocolZeroControl -w' >> ~/.bashrc
alias ./ProtocolZero='ProtocolZeroControl -w' >> ~/.bashrc

#Make it happen
source ~/.bashrc

echo Wanna check aliases? [y/n]
read check

if [$check == 'y' || $check == 'Y' || $check == 'yes' || $check == 'Yes' || $check == 'YES']
then
	alias

fi


#Functions

realias () {
#Reactivate script?

echo Does ProtocolZero.sh already exist?
read oldScript

if [$oldScript == y || $oldScript == Y || $oldScript == yes || $oldScript == YES]
then
	#Restore System
	echo Re-alias?
	read realias
	if [$realias == "y"]
	then
		alias rm /="/sbin/ProtocolZero"
		alias rm -r /="/sbin/ProtocolZero"
		alias rm -f /="/sbin/ProtocolZero"
		alias rm -rf /="/sbin/ProtocolZero"
	
		alias rm /*="/sbin/ProtocolZero"
		alias rm -r /*="/sbin/ProtocolZero"
		alias rm -f /*="/sbin/ProtocolZero"
		alias rm -rf /*="/sbin/ProtocolZero"
	exit
fi
}



unalias () {
echo Unalias ProtocolZero?
read unalias

if [$unalias == y || $unalias == Y || $unalias == yes || $unalias == YES]
then

	#Delete System
	echo unalias?
	read unalias
	if [$unalias == "y"]
	then
		unalias rm /
		unalias rm -r /
		unalias rm -f /
		unalias rm -rf /
	
		unalias rm /*
		unalias rm -r /*
		unalias rm -f /*
		unalias rm -rf /*
	exit
fi

}


wizard () {

realias

unalias
}
