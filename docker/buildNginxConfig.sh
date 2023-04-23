#!/bin/bash

cat << EOF
server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;
EOF

mapfile -t statusCodes < statusCodes.txt

for statusCodeLine in "${statusCodes[@]}"; do
  mapfile -t statusCode < <(echo "${statusCodeLine}" | tr ',' '\n')

  cat << EOF

    location /${statusCode[0]} {
        add_header Content-Type text/plain;
        return ${statusCode[0]} "${statusCode[0]} ${statusCode[1]}";
    }
EOF
done

cat << EOF
}
EOF