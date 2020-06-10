FROM ubuntu:18.04 

RUN apt-get update 
RUN apt-get install -y openssh-server pwgen
COPY run.sh /
COPY set_root_pw.sh /
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir /run/sshd

EXPOSE 22 
ENV AUTHORIZED_KEYS="**None**"
CMD ["/bin/bash", "-c", "/run.sh"]