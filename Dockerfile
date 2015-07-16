FROM ubuntu:14.04.2
MAINTAINER Craig Warner <warnercr@berea.edu

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        openssh-server pwgen sudo vim-tiny \
        net-tools \ 
        x11vnc xvfb default-jre lxde \
        gtk2-engines-murrine ttf-ubuntu-font-family \         
        nginx python-pip python-dev build-essential \
	unzip software-properties-common \
	xterm firefox vim gedit git 
	

#Pulls X-VNC client from some source, original  
ADD https://dl.dropboxusercontent.com/u/23905041/x11vnc_0.9.14-1.1ubuntu1_amd64.deb /tmp/
ADD https://dl.dropboxusercontent.com/u/23905041/x11vnc-data_0.9.14-1.1ubuntu1_all.deb /tmp/
RUN dpkg -i /tmp/x11vnc*.deb


# Pulls nand2tetris.zip from site, unzips and configures software tools
ADD http://nand2tetris.org/software/nand2tetris.zip /nand2tetris/
RUN unzip /nand2tetris/nand2tetris.zip && rm -fr /nand2tetris/nand2tetris.zip
RUN ln -s /nand2tetris/tools/HardwareSimulator.sh /bin/HardwareSimulator
RUN ln -s /nand2tetris/tools/CPUEmulator.sh /bin/CPUEmulator
RUN chmod +x /bin/HardwareSimulator && chmod +x /bin/CPUEmulator


#Adds web directory with webpages/scripting
ADD web /web/
RUN pip install -r /web/requirements.txt

#Part of VNC image build, original
ADD noVNC /noVNC/
ADD nginx.conf /etc/nginx/sites-enabled/default
ADD startup.sh /
ADD supervisord.conf /etc/supervisor/conf.d/


#Adds primary user, sets password, adds to sudo group
RUN adduser ubuntu
RUN chpasswd ubuntu:ubuntu
RUN adduser ubuntu sudo


#Volumes provide persistent storage directories for a container image.
VOLUME /c/Users/docker/:/home/ubuntu/storage
VOLUME /c/Users/google/:/GoogleDrive


#Gives ownership of intended storage directories to user
RUN chown ubuntu:ubuntu /home/ubuntu/storage
RUN chown ubuntu:ubuntu /GoogleDrive


ADD README.md /home/ubuntu/
ADD SOURCES.txt /home/ubuntu/
ADD EDITING.txt /home/ubuntu/

EXPOSE 6080
WORKDIR /root
ENTRYPOINT ["/startup.sh"]
