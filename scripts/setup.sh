echo 'Setting up TheHackCompany hackmachine'

echo '0. Prerequisites'
apt-get update -y
apt-get install -y build-essential python3-pip chromium-browser zip python3-virtualenv curl wget git

if [[ ":$PATH:" != ":$HOME/.local/bin:" ]]; then
  export PATH=$PATH:$HOME/.local/bin
  echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.profile
fi

echo '1. Installing GOLANG'
curl -OL https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz

if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  export PATH=$PATH:/usr/local/go/bin
  echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
fi

go version

if [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
  export PATH=$PATH:$HOME/go/bin
  echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.profile
fi


echo '5. Installing metasploit'
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall


echo '6. Security wordlists'
git clone --depth 1 https://github.com/danielmiessler/SecLists.git
