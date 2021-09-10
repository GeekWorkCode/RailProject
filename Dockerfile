FROM debian
RUN apt update
RUN apt install ssh wget npm -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/z.sh
RUN echo '/usr/sbin/sshd -D' >>/z.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:zsway|chpasswd
RUN chmod 755 /z.sh
EXPOSE 80
CMD  /z.sh
