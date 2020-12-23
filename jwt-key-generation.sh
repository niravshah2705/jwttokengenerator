#!/bin/bash 

# Open File jwt / jwk 

# {"keys":
#    [{
#        "k":"Y29tbW9uLXNlcnZpY2UtcHJvZA",
#        "kty":"oct",
#        "kid":"0001"
#    }]
#}

# update key below:
key="Y29tbW9uLXNlcnZpY2UtcHJvZA"
# Set Expiry Date:
expiry_date="$(date -d "Jun 01 2021" +%s)"
# Set Application Name without whitespace
application="CommonService"

#Output for reference:
orig_key=$(echo ${key} | base64 -d 2>/tmp/test)
echo "Original key :" $orig_key 
#key="$(echo -n ${orig_key} | base64 | tr '+\/' '-_' | tr -d '=')"
echo Hash key is : $key
echo "Application :" $application
echo "Expirty date:" $expiry_date
echo ""

jwt_header="$(cat jwt_header.json   |tr '\n' ' ' | sed -e 's/ //g'|  base64 | tr '+\/' '-_' | tr -d '=' |tr '\n' ' ' | sed -e 's/ //g' )"
jwt_payload="$(cat jwt_payload.json | sed -e ""s/bapi/${application}/"" | sed -e ""s/1600000/${expiry_date}/""|tr '\n' ' ' | sed -e 's/ //g'|  base64 | tr '+\/' '-_' | tr -d '=' |tr '\n' ' ' | sed -e 's/ //g' )"

unsigned_payload="${jwt_header}.${jwt_payload}"
singed_payload="$(echo -n $unsigned_payload| openssl dgst -binary -sha256 -hmac ${orig_key} | base64 | tr '+\/' '-_' | tr -d '=')"

final_payload="$(echo ${unsigned_payload}.${singed_payload})"

echo final JWT : $final_payload

#curl -H "Authorization: Bearer $final_payload" http://browser.test.com/health
#curl -L -v http://browser.test.com/health
