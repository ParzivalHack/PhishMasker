#!/bin/bash
figlet PhishMasker
echo -e "by Tommaso Bona"
echo -e "www.github.com/ParzivalHack"
# Function to check if the URL starts with http or https
url_checker() {
    if [[ ! "${1}" =~ ^(http|https):// ]]; then
        echo -e "\e[31m [!] Invalid URL. Please use http or https.\e[0m"
        exit 1
    fi
}
read -p "Input your Rebrand.ly API Key: " API_KEY
# (Additional ASCII art lines...)
echo -e "### Masking Domain ###"

# Prompt for Phishing URL
echo 'Paste Phishing URL here (with http or https): '
echo -en "=>"
read phish
url_checker $phish
sleep 1
echo -e "\e[1;33m [*] Processing and modifying phishing URL...\e[0m"
echo ""

# Define the data as JSON
data='{"destination": "'"$phish"'"}'

# Shorten the URL using Rebrandly
response=$(curl -s -X POST "https://api.rebrandly.com/v1/links" -H "apikey: $API_KEY" -H "Content-Type: application/json" -d "$data")

# Extract the shortened URL using jq
short=$(echo "$response" | jq -r '.shortUrl')

# Extract the shortened URL
shorter=${short}

echo -e "\n### Masking Domain ###"

# Prompt for Masking URL
echo 'Domain to mask the Phishing URL (with http or https):'
echo -en "=>"
read mask
url_checker $mask

# Prompt for social engineering words
echo -e '\nType Social Engineering words (like profile-name, free-followers).'
echo -e "\e[1;33m [*] Don't use spaces, use '-' between social engineering words\e[0m"
echo -en "=> "
read words

# Check for valid social engineering words
if [[ -z "$words" || "$words" =~ " " ]]; then
    echo -e "\e[31m [!] Invalid or empty words. Please avoid spaces.\e[0m"
    echo -e "\e[1;33m [*] Generating PhishMasker Link...\n"
    final="$mask/$words@$shorter"
    echo -e "Here is the PhishMasker URL:${final}"
    exit
fi

echo -e "\e[1;33m [*] Generating PhishMasker Link...\n"
shorter=${shorter#https://}
final=$mask-$words@$shorter
echo -e "\e[32m [+] Here is the PhishMasker URL: \e35m ${final}"
