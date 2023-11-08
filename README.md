# PhishMasker (PoC)

PhishMasker is a powerful and user-friendly Bash script, made as a (PoC), designed for the purpose of concealing and disguising phishing URLs. This tool is ideal for enhancing the effectiveness of social engineering campaigns by creating masked URLs that appear legitimate and appealing to potential targets. PhishMasker leverages the Rebrandly URL shortening service to shorten and mask the provided phishing URL. Users can customize the masked URL with their desired masking domain and social engineering words. This tool is a valuable addition to any ethical hacking or penetration testing toolkit, helping professionals simulate real-world scenarios while maintaining security and anonymity.

# How It Works:

PhishMasker operates by first validating the user-provided phishing URL to ensure it starts with either "http" or "https." It then proceeds to shorten the URL using the Rebrandly API, extracting the shortened URL from the API response. Afterward, the user is prompted to provide a masking domain (http or https) to create a disguised appearance for the phishing link. Additionally, users can include social engineering words, separated by hyphens, to further enhance the credibility of the URL. If no social engineering words are provided or if they contain spaces, PhishMasker informs the user and generates the masked URL without social engineering words. Finally, PhishMasker constructs the final masked URL, combining the masking domain, social engineering words, and the shortened URL, delivering an obfuscated URL ready for use in various social engineering engagements.

# Requirements

```sudo apt install jq```

```sudo apt install curl```

```pip install figlet```

# Download

Before downloading, the API_KEY in this script is generated and owned by me; you can use it as long as it works, consider it's limited to 25 masked links/month (total, not per user).

So if the tool isn't masking anymore URLs, it's because my personal API_KEY reached its monthly usage limit.


``` git clone https://github.com/ParzivalHack/PhishMasker```

```cd PhishMasker```

```chmod +x phishmasker.sh```

```bash phishmasker.sh```

If you use this tool for personal use, just go to https://rebrand.ly, create a free account, generate and use your own API_KEY.

To do so, after you ```git clone``` the repo and ```cd``` into the directory, just use ```nano phishmasker.sh``` to modify the bash script and just modify ```API_KEY``` by inserting your own. Then save with CTRL+S and exit nano with CTRL+X.
