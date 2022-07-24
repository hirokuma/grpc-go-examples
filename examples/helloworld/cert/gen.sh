#!/bin/bash -e

CA_DAYS=3650
CA_KEY_PEM="ca-key.pem"
CA_CERT_PEM="ca-cert.pem"
CA_CERT_SRL="ca-cert.srl"
SERVER_DAYS=365
SERVER_KEY_PEM="server-key.pem"
SERVER_REQ_PEM="server-req.pem"
SERVER_CERT_PEM="server-cert.pem"
SERVER_EXT_CNF="server-ext.cnf"
SUBJECT="/C=JP/ST=Fukuoka/L=Fukuoka/O=hiro99ma/OU=hirokuma/CN=localhost"

function removeAll() {
    rm -f ${CA_KEY_PEM} ${CA_CERT_PEM} ${CA_CERT_SRL}
    rm -f ${SERVER_KEY_PEM} ${SERVER_REQ_PEM} ${SERVER_CERT_PEM}
}

function generateCA() {
    rm -f ${CA_KEY_PEM} ${CA_CERT_PEM} ${CA_CERT_SRL}

    # 1. Generate CA's private key and self-signed certificate
    openssl req -x509 -newkey rsa:4096 -days ${CA_DAYS} -nodes -keyout ${CA_KEY_PEM} -out ${CA_CERT_PEM} -subj ${SUBJECT}

    echo "CA's self-signed certificate"
    openssl x509 -in ${CA_CERT_PEM} -noout -text
}

function generateServer() {
    rm -f ${SERVER_KEY_PEM} ${SERVER_REQ_PEM} ${SERVER_CERT_PEM}

    # 2. Generate web server's private key and certificate signing request (CSR)
    openssl req -newkey rsa:4096 -nodes -keyout ${SERVER_KEY_PEM} -out ${SERVER_REQ_PEM} -subj ${SUBJECT}

    # 3. Use CA's private key to sign web server's CSR and get back the signed certificate
    openssl x509 -req -in ${SERVER_REQ_PEM} -days ${SERVER_DAYS} -CA ${CA_CERT_PEM} -CAkey ${CA_KEY_PEM} -CAcreateserial -out ${SERVER_CERT_PEM} -extfile ${SERVER_EXT_CNF}

    echo "Server's signed certificate"
    openssl x509 -in ${SERVER_CERT_PEM} -noout -text
}

generateCA
generateServer

echo '--------------------------------'
echo 'DONE'
