# Kmergenie 1.7016
#
FROM gcc:5.1 
MAINTAINER Roger Barthelson 
LABEL Description="An app for the HTProcess pipeline that does kmer analysis using Kmergenie."
RUN apt-get -y update
RUN apt-get -y install r-base
RUN wget http://kmergenie.bx.psu.edu/kmergenie-1.7016.tar.gz && tar xvzf kmergenie-1.7016.tar.gz && cd kmergenie-1.7016 && make && make install
# chmod a+x kmergenie-1.7016/* && cp -r kmergenie-1.7016/* /usr/bin
RUN wget https://github.com/azroger/HTProcess-Pipeline/archive/0.0.5.tar.gz && tar xvzf 0.0.5.tar.gz && chmod a+x HTProcess-Pipeline-0.0.5/* && cp HTProcess-Pipeline-0.0.5/* /usr/bin
ENTRYPOINT [ "HTProcess_kmergenie.sh" ]
