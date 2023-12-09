#https://zandronum.com/download
#https://www.pc-freak.net/blog/doom-1-doom-2-doom-3-game-wad-files-for-download-playing-doom-on-debian-linux-via-freedoom-open-source-doom-engine/
#https://github.com/id-Software/
#https://zdoom.org/downloads
#https://archive.org/details/2020_03_22_DOOM
#docker build -f .\Dockerfile -t doom-srv .
FROM ubuntu:20.04
WORKDIR /wad
EXPOSE 10666

COPY . .

# Fix timezone issue
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#update main packages
RUN apt-get update 
RUN apt-get install wget  tar bzip2  -y 

#server files
RUN wget https://zandronum.com/downloads/zandronum3.1-linux-x86_64.tar.bz2
RUN bzip2 -d zandronum3.1-linux-x86_64.tar.bz2
RUN tar -xvf zandronum3.1-linux-x86_64.tar 

RUN apt-get install libgtk2.0-0 -y
RUN apt-get install libsdl1.2debian -y
RUN apt-get install libjpeg62 libgl1 -y

#RUN apt-get install libgtk2.0-0 libsdl1.2debian libjpeg62 libgl1 -y

#RUN apt-get install libgtk2.0-0 libsdl1.2debian libjpeg62 libgl1 ffmpeg libsm6 libxext6 -y



#RUN  apt-get install zandronum doomseeker-zandronum -y
#RUN apt-get install prboom freedoom -y
#CMD [ "npm", "start" ]
