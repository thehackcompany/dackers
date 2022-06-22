FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV PATH="${PATH}:/usr/local/go/bin:/root/go/bin"
WORKDIR /root
RUN apt-get update -y && \
    apt-get autoremove -y && \
    apt-get install -y \
    build-essential \
    libpcap-dev \
    software-properties-common \
    ca-certificates \
    lsb-release \
    apt-transport-https \
    zip \
    git \
    curl  \
    wget  \
    netcat \
    nmap \
    masscan \
    chromium-browser \
    # install Python3
    python3 python3-pip python3-distutils python3-virtualenv && \
    # install PHP
    add-apt-repository ppa:ondrej/php && \
    apt-get update -y && \
    apt-get install -y php8.1 \
    php8.1-mysql \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-curl && \
    # install Node.js
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    #installing GOLANG
    curl -OL https://go.dev/dl/go1.17.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz && \
    #installing METASPLOIT
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && ./msfinstall && \
    # installing RECON tools
    go install github.com/tomnomnom/assetfinder@latest && \
    go install github.com/tomnomnom/httprobe@master && \
    go install github.com/tomnomnom/meg@latest && \
    go install github.com/tomnomnom/fff@latest && \
    go install github.com/tomnomnom/anew@latest && \
    go install github.com/tomnomnom/waybackurls@latest && \
    go install github.com/tomnomnom/gf@latest && \
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest && \
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest && \
    go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest && \
    go install github.com/projectdiscovery/cloudlist/cmd/cloudlist@latest && \
    go install github.com/OJ/gobuster/v3@latest && \
    pip3 install py-altdns sqlmap && \
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip && \
    unzip aquatone_linux_amd64_1.7.0.zip -d /usr/local/go/bin && rm aquatone_linux_amd64_1.7.0.zip && \
    git clone https://github.com/GerbenJavado/LinkFinder.git /home/LinkFinder && \
    cd /home/LinkFinder && pip3 install -r requirements.txt && \
    git clone https://github.com/incogbyte/jsearch.git /home/jsearch && \
    cd /home/jsearch && pip3 install -r requirements.txt && \
    #installing wappalyzer from PyPI, the source code is located here: https://github.com/chorsley/python-Wappalyzer
    # python3 -m pip3 install python-Wappalyzer && \
    echo "FINISHED EVERYTHING SUCCESSFULLY"