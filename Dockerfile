FROM ubuntu:14.04

MAINTAINER <fanyin mengfanyin2013@163.com>

ADD sources.list /etc/apt/sources.list 

RUN apt-get update && apt-get install -y  make \
    gcc-arm-linux-gnueabi gcc lib32ncurses5  \
    lib32stdc++6 lib32ncurses5 lib32bz2-1.0 \
    lib32z1 u-boot-tools fakeroot libncurses5-dev \
    python bison flex xsltproc gperf g++ lzma zip \
    libxml2-utils git busybox 

ADD jdk-6u31-linux-x64.bin /usr/java/jdk-6u31-linux-x64.bin

WORKDIR /usr/java/

RUN ./jdk-6u31-linux-x64.bin  && \
    rm ./jdk-6u31-linux-x64.bin &&  echo "\
    export JAVA_HOME=/usr/java/jdk1.6.0_31 \n \
    export JRE_HOME=/usr/java/jdk1.6.0_31/jre \n \
    export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib:\$CLASSPATH \n \
    export PATH=\$JAVA_HOME/bin:\$JRE_HOME/bin:\$PATH" \
     >> /etc/profile  && echo "source /etc/profile" >> /root/.bashrc

WORKDIR /root

ENTRYPOINT ["/bin/bash"]


