# Fastqc-plus
#
FROM ubuntu:14.04
MAINTAINER Roger Barthelson LABEL Description="This image is used for the HTProcess app running FastQC and creating an output html file"
RUN apt-get -y update
RUN apt-get -y install wget && apt-get -y install unzip && apt-get -y install make
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip && unzip fastqc_v0.10.1.zip && chmod a+x FastQC/fastqc && cp -r FastQC/* /usr/bin
RUN apt-get -y install tzdata-java openjdk-7-jre-headless openjdk-7-jre default-jre
RUN wget -O - http://cpanmin.us | perl - App::cpanminus && cpanm File::Slurp
RUN wget https://github.com/azroger/HTProcess-Pipeline/archive/0.0.2.tar.gz
RUN tar xvzf 0.0.2.tar.gz && chmod a+x HTProcess-Pipeline-0.0.2/* && cp HTProcess-Pipeline-0.0.2/* /usr/bin
ENTRYPOINT [ "HTProcess_qc_pr_1.sh" ]
