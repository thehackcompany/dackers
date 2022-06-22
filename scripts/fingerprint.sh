echo '================================'
echo 'INSTALLING FINGERPRINTING TOOLS'
echo '================================'

sudo apt install -y nmap masscan

# wappalyzer
git clone https://github.com/vincd/wappylyzer.git
cd wappylyzer && \
virtualenv venv && \
source venv/bin/activate && \
pip install -r requirements.txt

# enumerates the subdomains and prints the used technology. Misses lots of subdomains, but usefull because of listing the technology stack
git clone https://github.com/guelfoweb/knock.git
cd knock && pip3 install -r requirements.txt

# Other online resoures
# 1. shodan.io 
# 2. censys.io/ipv4
