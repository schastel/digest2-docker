
cat > /usr/local/bin/digest2.sh <<EOF

LOGFILE=/mine/digest2.log
if [ ! -f /parameters/digest2.model ] || [ ! -f /parameters/MPC.config ]; then
   echo "Setting up digest2.model" >> \$LOGFILE
   cd /parameters
   wget https://bitbucket.org/mpcdev/digest2/downloads/d2model.tar.bz2 2>&1  >> \$LOGFILE
   tar xvfj d2model.tar.bz2 && rm -f d2model.tar.bz2 2>&1 >> \$LOGFILE
   mv d2model/digest2.model.csv .
   mv d2model/MPC.config .
   /usr/local/bin/digest2 -m digest2.model 2>&1  >> \$LOGFILE
   rm -rf d2model
else
   echo "digest2.model and MPC.config already in /parameters. Nice!"  >> \$LOGFILE
fi
if [ ! -f /parameters/digest2.obscodes ]; then
   echo "Setting up digest2.obscodes"  >> \$LOGFILE
   cd /parameters
   wget https://www.minorplanetcenter.net/iau/lists/ObsCodes.html --no-check-certificate 2>&1  >> \$LOGFILE
   mv ObsCodes.html digest2.obscodes
else
   echo "digest2.obscodes already in /parameters. Nice!" >> \$LOGFILE
fi

for filename in \$@; do
    echo "Processing [\$filename]" >> \$LOGFILE
    /usr/local/bin/digest2 -m /parameters/digest2.model -c /parameters/MPC.config -o /parameters/digest2.obscodes \$filename
done

EOF
chmod +x /usr/local/bin/digest2.sh
