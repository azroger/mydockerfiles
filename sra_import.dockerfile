# sra_import
#
FROM ubuntu:14.04.4 
MAINTAINER Roger Barthelson 
LABEL Description="This image is used for running SRA-tools, import SRA file"
RUN apt-get install -y wget unzip 
RUN wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.5.7/sratoolkit.2.5.7-ubuntu64.tar.gz && tar xvzf sratoolkit.2.5.7-ubuntu64.tar.gz && chmod a+x sratoolkit.2.5.7-ubuntu64/bin/* && cp -r sratoolkit.2.5.7-ubuntu64/bin/* /usr/bin
RUN wget http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz && tar xvzf aspera-connect-3.6.2.117442-linux-64.tar.gz && ./aspera-connect-3.6.2.117442-linux-64.sh && chmod a+x ~/.aspera/connect/bin/* 
RUN wget https://github.com/azroger/iPlant-basic-scripts/archive/master.zip && unzip master.zip && chmod a+x iPlant-basic-scripts-master/aspera_shell3.pl && cp iPlant-basic-scripts-master/aspera_shell3.pl /usr/bin
ENTRYPOINT [ "aspera_shell3.pl" ]
