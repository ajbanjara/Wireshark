\#\!/bin/sh

\#This script needs to be copied to the /bin directory.

\# You need to set yourself as the root user to set the permissions on this script to make it executable and to run this script.

\# Set the permissions using this command: chmod 755 /bin/menushark1.0.sh

echo ""

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*Menushark Version 1.0\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo "\* menushark is an attempt to create a menu system to allow users to \*"

echo "\* employ the use of tshark by answering a few menu questions. The \*"

echo "\* menushark script also gives you the command that the menu system has \*"

echo "\* made to try to teach you how to use tshark at the command line. \*"

echo "\* Here's what it does: \*"

echo "\* 1)Asks you questions to put together a command line. \*"

echo "\* 2)Shows you the command line it created. \*"

echo "\* 3)It runs the command. \*"

echo "\* 4)A capture file is created, rights on it are changed - read by all. \*"

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo "\* Send questions, comments and suggestions to [jprudente@smualumni.smu.edu](mailto:jprudente@yahoo.com) \*"

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo ""

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo "\* Remember - you have to run this as the root user. \*"

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*"

echo "Press enter to continue"

echo ""

read

echo "Reading Interfaces available by using the tshark -D command."

echo ""

tshark -D

echo ""

echo "Select which interface would you like to capture from?"

echo "Then press enter."

read interface

echo ""

echo "You chose interface $interface."

echo ""

echo "Type a filename for the capture file."

echo "Then press enter"

read inputfile

echo ""

capfile="$inputfile"

echo "You are creating a cature file named $capfile."

echo ""

PS3="Choose (1-27):"

echo "Choose a Protocol or port filter from the list below - Select 1 for NO FILTER."

echo "Then press enter."

select filter in "" tcp udp ip ip6 ether icmp icmp6 fddi tr arp rarp "port 20 or 21" "port 22" "port 23" "port 25" "port 37" "port 53" "port 69" "port 80" "port 110" "port 161 or 162" "port 443" "port 514" "port 1719 or 1720" "dst port 5010" "port 5060 or 5061"

do

break

done

echo""

echo "To filter on a host name or IP address for the capture filter"

echo "type it here then press enter. Or just hit enter for NO FILTER"

echo ""

read inputhost

echo ""

host="$inputhost"

echo ""

echo "You chose to filter using $filter $host."

echo ""

echo "Press CTRL c to stop the capture"

echo ""

echo "Command being executed by the menu script:"

echo "tshark -i $interface -w $capfile $filter $host"

echo ""

echo "Capture started:"

date

\# Now write the string created to the command line for the user

tshark -i $interface -w $capfile $filter

echo ""

echo "Capture finished:"

date

chmod 644 $capfile

echo ""

echo "The file $capfile has been set with attributes of 644 using the command:"

echo "chmod 644 $capfile - so it can be read by anyone."

echo ""

echo "Your current directory is:"

pwd

echo ""

---

Imported from https://wiki.wireshark.org/menushark on 2020-08-11 23:16:39 UTC
