# HTTP Server Double

NGINX webserver that maps HTTP status codes to URLs and responds with corresponding status code.

All [HTTP response status codes listed on MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) are mapped.

```console
$ docker run -d -p 8080:80 ghcr.io/d12sventures/http-server-double:latest

$ curl -I http://localhost:8080/200
HTTP/1.1 200 OK
Server: nginx/1.23.4
Date: Sun, 23 Apr 2023 16:52:00 GMT
Content-Type: application/octet-stream
Content-Length: 6
Connection: keep-alive
Content-Type: text/plain

$ curl http://localhost:8080/200
200 OK

$ curl -I http://localhost:8080/401
HTTP/1.1 401 Unauthorized
Server: nginx/1.23.4
Date: Sun, 23 Apr 2023 16:52:58 GMT
Content-Type: application/octet-stream
Content-Length: 16
Connection: keep-alive

$ curl http://localhost:8080/401
401 Unauthorized
```