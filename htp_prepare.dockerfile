# htp_prepare_directories
#
FROM ubuntu:14.04
MAINTAINER Roger Barthelson LABEL Description="This image is used for running htp_prepare_directories"
RUN apt-get -y update
RUN apt-get -y install wget
RUN wget https://github.com/azroger/HTProcess-Pipeline/archive/0.0.2.tar.gz
RUN tar xvzf 0.0.2.tar.gz && chmod a+x HTProcess-Pipeline-0.0.2/* && cp HTProcess-Pipeline-0.0.2/* /usr/bin
ENTRYPOINT [ "make_folders.pl" ]
