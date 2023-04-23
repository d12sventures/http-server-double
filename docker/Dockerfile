FROM debian:bullseye

COPY buildNginxConfig.sh statusCodes.txt /

RUN ./buildNginxConfig.sh > /default.conf

FROM nginx:1.23.4

COPY --from=0 /default.conf /etc/nginx/conf.d/default.conf