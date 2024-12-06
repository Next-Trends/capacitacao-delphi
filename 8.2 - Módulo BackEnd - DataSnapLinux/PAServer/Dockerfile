FROM ubuntu:jammy
 
ARG password=
 
ENV PA_SERVER_PASSWORD=$password
 
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yy install \
    build-essential \
    libcurl4-openssl-dev \
    libcurl3-gnutls \
    libgl1-mesa-dev \
    libgtk-3-bin \
    libosmesa-dev \
    libpython3.10 \
	fontconfig \
    gcc \
    vim \
    xorg \
    zlib1g-dev
 
RUN apt update \
&& apt-get -y install \
    wget \
    gnupg \
	vim
	
# Atualizar o sistema e instalar bibliotecas
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libcurl4 libssl-dev libnss3 libstdc++6 zlib1g libncurses5 libfbclient2 && \
    ln -s /usr/lib/x86_64-linux-gnu/libfbclient.so.2 /usr/lib/x86_64-linux-gnu/libfbclient.so && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
 
### Install PAServer

#Delphi 12

# ADD http://altd.embarcadero.com/releases/studio/23.0/120/LinuxPAServer23.0.tar.gz ./paserver.tar.gz 

#Delphi 12.1

ADD https://altd.embarcadero.com/releases/studio/23.0/121/1211/LinuxPAServer23.0.tar.gz ./paserver.tar.gz 

RUN tar xvzf paserver.tar.gz

RUN mv PAServer-23.0/* .
 
# link to installed libpython3.10

RUN mv lldb/lib/libpython3.so lldb/lib/libpython3.so_

RUN ln -s /lib/x86_64-linux-gnu/libpython3.10.so.1 lldb/lib/libpython3.so
 
RUN apt -y install libpng16-16

RUN apt -y install ca-certificates

RUN wget https://www.openssl.org/source/openssl-1.0.2u.tar.gz

RUN tar -xvzf openssl-1.0.2u.tar.gz

RUN ls -l

RUN cd openssl-1.0.2u && ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib && make && make install && \
    echo "/usr/local/openssl/lib" | tee /etc/ld.so.conf.d/openssl-1.0.2u.conf && \
    ldconfig && \
    export PATH=/usr/local/openssl/bin:$PATH && \
    ln -s /usr/local/openssl/lib/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.1.0.0 && \
    ln -s /usr/local/openssl/lib/libssl.so.1.0.0 /usr/lib/libssl.so.1.0.0 && \
    export LD_LIBRARY_PATH=/usr/local/openssl/lib:$LD_LIBRARY_PATH
 
#RUN cp /usr/lib/x86_64-linux-gnu/libpq.so.5 /usr/lib/x86_64-linux-gnu/libpq.so

# PAServer
EXPOSE 64211
 
CMD ./paserver 
 
 