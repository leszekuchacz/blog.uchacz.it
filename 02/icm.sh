#!/bin/bash

usage() { echo 'Usage: -t "HELP ME" -c "i am in journal.." -e ilovespam@uchacz.it -e spammemoreplz@uchacz.it -d 2017-05-05-11:00'; }


# reading config file 
source mail.conf


#udate ca
#pacman -S ca-certificates


while getopts "e:d:t:c:h:g" options;
do
	case $options in
		h)
			usage
			;;
		e)
			emails+=$OPTARG' '	
		  	;;
		d)
			date=$OPTARG
			;;
		t)
			topic=$OPTARG
			;;
		c)
			con=$OPTARG
			;;
		g)	
			gsm+=$OPTARG' '	
			;;
		*)
		  	usage
			exit 1
		  	;;
	esac
done

shift $(( $OPTIND - 1 ))


### CHECK ###

if [ ! "$topic" ] 
then
	echo " brak Tematu !"
	usage
	exit 1
fi

if [ ! "$emails" ]
then
	echo " brak emailu"
	usage
	exit 1
fi

if [ ! "$con" ] 
then
	echo " brak Tresci"
	usage
	exit 1
fi

#################
### MAIN LOOP ###
#################

while true
do
	sleep 30

	now=$(date   +"%Y-%m-%d-%H:%M")
	echo -e $now'\n'
	if [[ $date < $now ]];
	then
		############
		## EMAILS ##
		############
		for e  in $emails
		do	
			echo $e	
		echo -e "$con" | mailx -v -s "$topic" -S smtp-use-starttls -S ssl-verify=ignore -S smtp-auth=login -S smtp=$smtp -S from="$email( USZATEK BLOG IT)" -S smtp-auth-user="$login" -S smtp-auth-password="$pass" -S ssl-verify=ignore  $e
		done

		#########
		## GSM ##
		#########
		if [ ! "$gsm" ]
		then

			for g in $gsm
			do
				/usr/sbin/semdsms /dev/ttyUSB2 $g $con
			done
		fi
		exit 1;
	fi
done
