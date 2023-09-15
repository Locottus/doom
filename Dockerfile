#https://zandronum.com/download
#https://www.pc-freak.net/blog/doom-1-doom-2-doom-3-game-wad-files-for-download-playing-doom-on-debian-linux-via-freedoom-open-source-doom-engine/
#https://github.com/id-Software/
#https://zdoom.org/downloads
#docker build -f .\Dockerfile -t doom-srv .
FROM ubuntu:20.04
WORKDIR /doom
COPY . .
RUN apt-get update &&  apt-get install ssh wget curl tar bzip2 gcc git -y && rm -rf /var/lib/apt/lists/*
RUN apt-get install --reinstall libgtk2.0-0 -y

#RUN apt-get update && apt-get upgrade -y && apt-get install ssh wget curl tar bzip2 -y  && rm -rf /var/lib/apt/lists/*
RUN wget https://zandronum.com/downloads/zandronum3.1-linux-x86_64.tar.bz2

RUN bzip2 -d zandronum3.1-linux-x86_64.tar.bz2
RUN tar -xvf zandronum3.1-linux-x86_64.tar 






#EXPOSE 3000
#RUN wget -O - http://debian.drdteam.org/drdteam.gpg | sudo apt-key add -
#RUN add-apt-repository 'deb http://debian.drdteam.org/ stable multiverse'
#RUN  apt-get update
#RUN  apt-get install zandronum doomseeker-zandronum -y
#RUN wget https://youfailit.net/pub/idgames/idstuff/doom/doom19s.zip
#RUN wget https://doomwiki.org/wiki/DOOM2.WAD
#RUN apt-get install prboom freedoom -y
#CMD [ "npm", "start" ]
