#!/user/bin/env bash
echo "What is the domain we're looking up?"
read domain

echo -en '\n'

echo "Here are the DNS records:"

echo -en '\n'

echo "Nameservers:"
dig @1.1.1.1 $domain NS +short

echo -en '\n'

echo "A record:"
dig @1.1.1.1 $domain A +short

echo -en '\n'

echo "MX records:"
dig @1.1.1.1 $domain MX +short

echo -en '\n'

echo "TXT record(s):"
dig @1.1.1.1 $domain TXT +short

dkim="dig @1.1.1.1 _domainkey.$domain"

echo -en '\n'

if [ -z "$dkim" ]
then
	echo "This domain does not have a DKIM record"
else
	echo "This domain does have a DKIM record"
fi
