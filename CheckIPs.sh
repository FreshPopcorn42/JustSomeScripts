 #!/bin/bash
 
 newLine = "\n"
 index = 0
 declare -a IP
 continue = "n"
 
 date > CheckIPs.txt
 newLine >> CheckIPs.txt
 newLine >> CheckIPs.txt
 
 while [ continue -eq 0 ]
 do
 	read -p "Enter IP: " IP[index]
 	read -p "more IPs? [y/n]" continue
 	index++
 done
 
 for i in {0..$index}
 do
 	ping ${IP[i]} >> CheckIPs.txt
 	newLine >> CheckIPs.txt
 done
