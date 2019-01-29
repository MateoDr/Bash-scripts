#!/usr/bin/env bash

dns_check() {

echo -e "\n\nWhat is the domain we're looking up?"
read domain

echo -e "\nHere are the DNS records:"

echo -e "\nNameservers:"
dig @1.1.1.1 $domain NS +short

echo -e "\nA record:"
dig @1.1.1.1 $domain A +short

echo -e "\nMX records:"
dig @1.1.1.1 $domain MX +short

echo -e "\nTXT record(s):"
dig @1.1.1.1 $domain TXT +short

dkim="dig @1.1.1.1 _domainkey.$domain"

if [ -z "$dkim" ]
then
	echo -e "\nThis domain does not have a DKIM record"
else
	echo -e "\nThis domain does have a DKIM record"
fi
}

dns_check

while true; do
	read -n 1 -p "Would you like to check another domain? (y/n) " checkem

	case $checkem in
		y) 
			dns_check
		;;
		n) 
			exit 0
		;;
		*) 
			echo -e "\n\nThat's not a valid character, please type y or n"
		;;
	esac
done
