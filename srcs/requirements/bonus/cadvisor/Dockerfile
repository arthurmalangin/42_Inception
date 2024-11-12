FROM debian:bullseye

RUN apt-get update && apt-get install wget -y

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -O /etc/cAdvisor
RUN chmod +x /etc/cAdvisor

EXPOSE 8080

CMD ["/etc/cAdvisor"]