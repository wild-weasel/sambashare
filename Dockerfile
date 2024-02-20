FROM ubuntu:22.04
RUN apt update &&\
  apt install -y samba &&\
  apt autoclean && apt autoremove
RUN mkdir /share
ADD entrypoint.sh .
RUN chmod +x entrypoint.sh
CMD ["/entrypoint.sh"]
