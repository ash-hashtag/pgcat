# openssl req -x509 -newkey rsa:2048 -nodes \
#   -keyout key.pem -out cert.pem \
#   -days 365 -subj "/CN=localhost" \
#   -addext "basicConstraints=CA:FALSE" \
#   -addext "keyUsage = digitalSignature, keyEncipherment" \
#   -addext "extendedKeyUsage = serverAuth"
  

  
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout key.pem -out cert.pem \
  -days 365 -config cert.conf
