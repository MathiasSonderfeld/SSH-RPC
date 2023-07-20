FROM alpine:latest
RUN ["apk", "update", "&&", "apk", "upgrade"]
RUN ["apk", "add", "openssh"]
RUN ["apk", "add", "screen"]

#copy ssh config
RUN ["mkdir", "-p", "/root/.ssh"]
COPY ./strato_rsa /root/.ssh/id_rsa
COPY ./known_hosts /root/.ssh/known_hosts
COPY ./config /root/.ssh/config

#copy runscript
COPY ./entry.sh /root/entry.sh
COPY ./connectToServer.sh /root/connectToServer.sh
RUN ["chmod", "700", "/root/entry.sh", "/root/connectToServer.sh"]
ENTRYPOINT ["/bin/sh", "/root/entry.sh"]