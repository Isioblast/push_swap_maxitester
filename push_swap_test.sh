# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap_test.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tde-vlee <tde-vlee@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/19 16:31:55 by tde-vlee          #+#    #+#              #
#    Updated: 2021/12/23 12:25:13 by tde-vlee         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# I'm not really good in bash script,
# i hope your eyes will not pop out of you head after seeing this code <3

NAME="../push_swap"
GREEN="\e[92m"
YELLOW="\e[1m\e[93m"
RED="\e[1m\e[91m"
RESCOLOR="\e[0m"
OK=0
MEH=0
KO=0
MED=0
MAX=0
MAXL=0
CHECKER_OK=0
CHECKER_KO=0
STAT=0

#2147483647
#-2147483648
parse () {
printf "\n============
PARSING TEST
============\n"
LST=""
LST="0"
LST="1 -1"
LST="0 -1"
LST="3 2a1"
LST="3 2  1"
RESULT=`$NAME 5 ""`
RESULT=`$NAME 5 "          "`
RESULT=`$NAME ""`
RESULT=`$NAME "              "`
RESULT=`$NAME "" 5`
#ADD all the string test as `$NAME test` too
LST="     3           2        1        "
LST="3 2 1"
LST="0 1 2 3 4 5 6 7 8 9"
LST="0 -1 2 -3 4 5 -6 7 8 9"
LST="0 -1 2 -3 4 5 -6 7 8 -2147483648"
LST="0 -1 2 -3 4 5 -6 7 8 2147483647"
LST="0 -1 2 -3 4 5 -6 7 8 2147483648"
LST="0 -1 2 -3 4 5 -6 7 8 2147483649"
LST="2147483649 0 -1 2 -3 4 5 -6 7 8"
LST="2147483657 0 -1 2 -3 4 5 -6 7 8"
LST="0 -1 2 -3 4 5 -6 7 8 9999999999999999999999990"
LST="5 12 41 56 68 42 17 97 16 35 62 20 85 92"
printf ""
}

small () {
MED=0
MAX=0
MAXL=0
OPERATIONS=0
CHECKER_OK=0
CHECKER_KO=0
printf "\n=====================================
TESTING WITH COMBINATIONS OF 5 DIGITS
=====================================\n"
for i in {1..120}
do
	ARG=`sed "${i}q;d" list_files/5.txt`
	N=`$NAME $ARG | wc -l | tr -d " "`
	((MED=MED+N))
	if [ $N -gt $MAX ]
	then
		((MAX=$N))
		((MAXL=$i))
	fi
	if [ $N -lt 13 ]
	then
		printf "$GREEN $ARG = $N$RESCOLOR\n"
		((OK=OK+1))
	else
		printf "$RED $ARG = $N$RESCOLOR\n"
		((KO=KO+1))
	fi
	STATUS=`$NAME $ARG | ./checker_mac $ARG`;
	if [ "$STATUS" = "OK" ]
	then
		((CHECKER_OK=$CHECKER_OK+1))
	else
		((CHECKER_KO=$CHECKER_KO+1))
	fi
	printf "Checker status = $STATUS\n"
done
((MED=MED/120))
printf "AVRG = $MED\nMAX = $MAX On line : $MAXL\n";
showresult
loveline
}

#700 900 1100 1300 1500
medium () {
MED=0
MAX=0
MAXL=0
CHECKER_OK=0
CHECKER_KO=0
printf "\n=======================================
TESTING WITH COMBINATIONS OF 100 DIGITS
=======================================\n"
	for i in {1..200}
	do
		ARG=`sed "${i}q;d" list_files/100x200.txt`
		N=`$NAME $ARG | wc -l | tr -d " "`
		((MED=MED+N))
		if [ $N -gt $MAX ]
		then
			((MAX=$N))
			((MAXL=$i))
		fi
		if [ $N -lt 700 ]
		then
			printf "$GREEN $ARG = $N$RESCOLOR\n"
			((OK=OK+1))
		elif [ $N -lt 1500 ]
		then
			((MEH=MEH+1))
			printf "$YELLOW $ARG = $N$RESCOLOR\n"
		else
			printf "$RED $ARG = $N$RESCOLOR\n"
			((KO=KO+1))
		fi
		STATUS=`$NAME $ARG | ./checker_mac $ARG`;
		if [ "$STATUS" = "OK" ]
		then
			((CHECKER_OK=$CHECKER_OK+1))
		else
			((CHECKER_KO=$CHECKER_KO+1))
		fi
		printf "Checker status = $STATUS\n"
	done
((MED=MED/199))
printf "AVRG = $MED\nMAX = $MAX On line : $MAXL\n";
showresult
purfect
loveline
}

#5500 #7000 #8500 #10000 #11500
large () {
MED=0
MAX=0
MAXL=0
CHECKER_OK=0
CHECKER_KO=0
printf "\n=======================================
TESTING WITH COMBINATIONS OF 500 DIGITS
=======================================\n"
	for i in {1..100}
	do
		ARG=`sed "${i}q;d" list_files/500x100.txt`
		N=`$NAME $ARG | wc -l | tr -d " "`
		((MED=MED+N))
		if [ $N -gt $MAX ]
		then
			((MAX=$N))
			((MAXL=$i))
		fi
		if [ $N -lt 5500 ]
		then
			printf "$GREEN $ARG = $N$RESCOLOR\n"
			((OK=OK+1))
		elif [ $N -lt 11500 ]
		then
			((MEH=MEH+1))
			printf "$YELLOW $ARG = $N$RESCOLOR\n"
		else
			printf "$RED $ARG = $N$RESCOLOR\n"
			((KO=KO+1))
		fi
		STATUS=`$NAME $ARG | ./checker_mac $ARG`;
		if [ "$STATUS" = "OK" ]
		then
			((CHECKER_OK=$CHECKER_OK+1))
		else
			((CHECKER_KO=$CHECKER_KO+1))
		fi
		printf "Checker status = $STATUS\n"
	done
((MED=MED/100))
printf "AVRG = $MED\nMAX = $MAX On line : $MAXL\n";
showresult
purfect
loveline
}

#5500 #7000 #8500 #10000 #11500
maxilarge () {
MED=0
MAX=0
MAXL=0
CHECKER_OK=0
CHECKER_KO=0
printf "\n============================================
TESTING WITH MAXI COMBINATIONS OF 500 DIGITS
============================================\n"
	for i in {1..100}
	do
		ARG=`sed "${i}q;d" list_files/500x100_large_numbers.txt`
		N=`$NAME $ARG | wc -l | tr -d " "`
		((MED=MED+N))
		if [ $N -gt $MAX ]
		then
			((MAX=$N))
			((MAXL=$i))
		fi
		if [ $N -lt 5500 ]
		then
			printf "$GREEN $ARG = $N$RESCOLOR\n"
			((OK=OK+1))
		elif [ $N -lt 11500 ]
		then
			((MEH=MEH+1))
			printf "$YELLOW $ARG = $N$RESCOLOR\n"
		else
			printf "$RED $ARG = $N$RESCOLOR\n"
			((KO=KO+1))
		fi
		STATUS=`$NAME $ARG | ./checker_mac $ARG`;
		if [ "$STATUS" = "OK" ]
		then
			((CHECKER_OK=$CHECKER_OK+1))
		else
			((CHECKER_KO=$CHECKER_KO+1))
		fi
		printf "Checker status = $STATUS\n"
	done
((MED=MED/100))
printf "AVRG = $MED\nMAX = $MAX On line : $MAXL\n";
showresult
purfect
loveline
}

purfect ()
{
if [ $KO -eq 0 -a $MEH -eq 0 ]
then
	printf "\e[93m       .''.      .        *''*    :_\/_:     .
      :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
 :_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
 : /\ : :::::     *_\/_*     -= o =-  /)\    '  *
  '..'  ':::'     * /\ *     .'/.\'.   '
      *            *..*         :
        *
        *
\e[92m
██████╗ ██╗   ██╗██████╗ ███████╗███████╗ ██████╗████████╗
██╔══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝
██████╔╝██║   ██║██████╔╝█████╗  █████╗  ██║        ██║   
██╔═══╝ ██║   ██║██╔══██╗██╔══╝  ██╔══╝  ██║        ██║   
██║     ╚██████╔╝██║  ██║██║     ███████╗╚██████╗   ██║   
╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝\n"
fi
}

loveline ()
{
if [ $KO -gt 1 ]
then
	printf "it smell like poop here, ho no sorry, it's your coding skills"
fi
}

showresult ()
{
printf "NB INST :\n"
printf "$GREEN OK : $OK$RESCOLOR\n"
printf "$YELLOW MEH : $MEH$RESCOLOR\n"
printf "$RED KO : $KO$RESCOLOR\n"
printf "CHECKER STATUS :\n"
printf "$GREEN OK : $CHECKER_OK$RESCOLOR\n"
printf "$RED KO : $CHECKER_KO$RESCOLOR\n"
}

while getopts "psmlx" flag;
do
    case "${flag}" in
		p) parse;;
        s) small;;
        m) medium;;
        l) large;;
		x) maxilarge;
    esac
done

