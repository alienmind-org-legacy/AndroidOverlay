if [ "$#" != "2" ]; then
 echo "Usage: sign.sh <rom.zip> <rom-signed.zip>"
 exit 1
fi
java -jar tools/signapk.jar -w tools/testkey.x509.pem tools/testkey.pk8 $1 $2
