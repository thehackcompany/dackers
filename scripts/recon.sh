echo '============================'
echo 'INSTALLING RECON TOOLS'
echo '============================'

source /etc/profile

# tomnomnom tools
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/httprobe@master
go install github.com/tomnomnom/meg@latest
go install github.com/tomnomnom/fff@latest
go install github.com/tomnomnom/anew@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/gf@latest

# projectdiscovery tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo apt install -y libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install github.com/projectdiscovery/cloudlist/cmd/cloudlist@latest

# owasp tools
sudo snap install amass

git clone https://github.com/blechschmidt/massdns.git massdns && \
  cd massdns/ && make && sudo cp ./bin/massdns /usr/local/bin

pip3 install py-altdns

# gobuster: brute-force tool. Needs very good wordlists
go install github.com/OJ/gobuster/v3@latest

# aquatone: website screenshots
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip 
unzip aquatone_linux_amd64_1.7.0.zip -d /usr/local/go/bin && rm aquatone_linux_amd64_1.7.0.zip

# eyewitness: another website screenshots tool
# git clone https://github.com/FortyNorthSecurity/EyeWitness.git EyeWitness && \
#   cd EyeWitness/Python/setup && \
#   sudo ./setup.sh

# JavaScript recon tools

git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder && pip3 install -r requirements.txt

git clone https://github.com/incogbyte/jsearch.git
cd jsearch && pip3 install -r requirements.txt