FROM kalilinux/kali-rolling

LABEL maintainer="realmadsci"

RUN apt-get update && apt-get install -y \
    bash-completion \
    aircrack-ng \
  && rm -rf /var/lib/apt/lists/*

RUN printf "alias ll='ls $LS_OPTIONS -l'\nalias l='ls $LS_OPTIONS -lA'\n\n# enable bash completion in interactive shells\nif [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi\n" > /root/.bashrc
RUN mkdir /data

WORKDIR /host
CMD "/bin/bash"