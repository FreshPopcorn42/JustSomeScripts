#!/bin/bash

#Replace Schneewitchen path with variable, integrate function to change path and move stuff (optional)
##COLOR?

#Title
echo Schneewittchen
echo By Nando Sterki
start

start() {

    #Set everything to null, except num
    today = null
    a = null
    s = null
    del = null
    JN = null
    cls

    echo \n
    echo \n
    echo --------------------------------%date:~0%--------------------------------
    echo.
    echo ------------------------------Hello %USERNAME%------------------------------
    echo.
    echo.

    read a
    if [$a == 'exit' || $a == 'Exit' || $a == '']
    do
        exit
    elif [$a == 'new' || $a == 'New']
    do  new
    elif [$a == 'search' || $a == 'search']
    do
        search
    elif [$a == 'help' ||$a == 'Help']
    do
        help
    elif [$a == 'del' || $a == 'Del']
    do
        del
    elif [$a == 'color' || $a == 'Color']
    do
        color
    #If all is false, go to help
    elif [$num == 2]
        help
    else
        $num += 1
    fi

#read continue

}

#New note
new() {
    echo \n
    echo \n
    echo --------------------------------%date:~0%--------------------------------
    echo \n
    echo ------------------------------New note:------------------------------
    echo \n
    echo \n

    #Make note
    read note
    echo \n >> /home/$USERNAME/Schneewittchen/$date.txt

    #"Title" of new note
    echo  Created by %USERNAME% on %date:~0% at %time:~0,5%>> /home/$USERNAME/Schneewittchen/$date.txt
    echo \n >> /home/$USERNAME/Schneewittchen/$date.txt
    #Write actual note to document
    echo $note >> /home/$USERNAME/Schneewittchen/$date.txt
    echo \n >> /home/$USERNAME/Schneewittchen/$date.txt
    echo \n >> /home/$USERNAME/Schneewittchen/$date.txt

    read continue
    start
}

searchFile() {
    #Info
    clear
    echo\n
    echo\n
    echo --------------------------------%date:~0%--------------------------------
    echo\n
    echo                                  ~Search~
    echo\n
    echo You can only search documents that are located in the Schneewitchen path.\nDefault: /home/$USERNAME/Schneewittchen/
    clear
    #Actual searchmode
    echo\n
    echo\n
    echo --------------------------------%date:~0%--------------------------------
    echo\n
    echo                                  ~Search~
    echo\n
    echo Which document are you looking for? Press "x" to exit searchmode.
    echo\n

    #Search input
    read search

    #Does it exist? If yes, open it.
    if [exist /home/$USERNAME/Schneewittchen/$search.*]
    do
        start /home/$USERNAME/Schneewittchen/$search.*
    elif [$search == 'x' || $search == 'X']
        start
    #If file doesnt exist:
    else
        echo \n
        echo \n
        echo File $search doesnt exist...
    fi

    echo \n
    echo Continue searching? [y/n]

    read yn
    if [$yn == "y" || $yn == "Y"]
    do
        searchFile
    elif [$yn == "" || $yn == "n" || $yn == "N"]

    else
        help
    fi

    read continue
    clear
    start
}

delFiles() {
    clear
    #Info
    clear
    echo\n
    echo\n
    echo --------------------------------%date:~0%--------------------------------
    echo\n
    echo                                  ~Search~
    echo\n
    echo You can only search documents that are located in the Schneewitchen path.\nDefault: /home/$USERNAME/Schneewittchen/
    clear
    #Actual delMode
    echo \n
    echo \n
    echo Which document do you want to delete?
    echo Which filetype?
    echo \n

    #Take input
    read del

    #Does it exist? If yes, delete it.
    if [exist /home/$USERNAME/Schneewittchen/$del.$filetype]
    do
        rm -rf /home/$USERNAME/Schneewittchen/$del.$filetype
        #Feedback
        echo $del.$filetype has been deleted from /home/$USERNAME/Schneewittchen/
    elif [$del == "x" || $del == "X"]
        start
    else
        echo \n
        echo \n
        echo $del.$filetype doesnt exist in /home/$USERNAME/Schneewittchen/...
    fi
    echo \n

    #Continue?
    echo Continue deleting stuff?
    echo \n
    echo \n
    read yn

    if [$xn == "y" || $yn == "Y"]
    do
        delFiles
    elif [$yn == "" || $yn == "n" || $yn == "N"]
        start
    else
        help
    fi

    #read continue
    #clear
    #start
}

#changeColor() {
#
#}

#Help
help() {
    clear
    echo \n
    echo --------------------------------Help--------------------------------
    echo \n
    echo \n

    #Help for: new document
    echo Type "New" for creating a new note.
    echo Every note gets automatically saved in Documents\Schneewittchen. The filename is always the current date.
    echo If you write more than one note on the same day, they are both saved in the same file,
    echo but marked with timestamps.
    echo \n
    echo \n

    #Help for: search document
    echo If you wanna open an existing note, just type "Search".
    echo Then simply write the name of the file you are looking for
    echo (You may want to rename your most important files fo this purpose).
    echo This function is only able to see files that are located at the Schneewitchen path,
    echo default is /home/$USERNAME/Schneewittchen.
    echo \n
    echo \n

    #Help for: close session
    echo For exiting the program, simply type "exit", press the big red button
    echo in the right top corner or press enter.
    echo \n
    echo \n

    #Help for: delete document
    echo for deleting a document, type 'del'.
    echo This function is only able to see files that are located at the Schneewitchen path,
    echo default is /home/$USERNAME/Schneewittchen.
    echo \n
    echo \n

    #Set back help-needed-indicator
    $num == 0

    start
}
