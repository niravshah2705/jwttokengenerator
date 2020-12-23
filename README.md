# jwttokengenerator
Generate new jwt token with shell script

# Download code
git clone https://github.com/niravshah2705/jwttokengenerator

# Modify parameter
Open Existing jwt token key file(.jwt/.jwk) from nginx conf  
Modify key in the script accordingly  
Modify desired expiry date of new token  
Supply appropriate application name  

# Execute code
./jwt-key-generation.sh  
Original key : common-service-prod  
Hash key is : Y29tbW9uLXNlcnZpY2UtcHJvZA  
Application : CommonService  
Expirty date: 1622485800  

final JWT : eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjAwMDEifQ.eyJuYW1lIjoiQ29tbW9uU2VydmljZSIsInN1YiI6ImFwaSIsImV4cCI6IjE2MjI0ODU4MDAiLCJpc3MiOiJicjIifQ.y2zGN8ty7yxCW8kl-0wfEfwbtVXJeBdXNm8VvG6iU_4  


# Reference:
https://niravshah2705.medium.com/generate-new-jwt-token-26b84196988d
