openssl genrsa -out privkey.pem 2048
openssl req -new -key privkey.pem -out server.csr -config server-openssl.cnf
# Sign the key
# Keep under 825 days to keep apple happy
openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key \
  -CAcreateserial -out fullchain.pem -days 398 -sha256 \
  -extensions v3_req -extfile server-openssl.cnf
