# Update ubuntu and prepare for 
apt-get update
apt-get upgrade -y
apt-get install -y git make gcc wget

#
# Install digest2
#
mkdir -p /digest2
cd /digest2
git clone https://bitbucket.org/mpcdev/digest2.git .
make
cp ./digest2 /usr/local/bin/

