# HTProcess-Tophat 2.1.1
#
#FROM ubuntu
FROM gcc:5.1  
MAINTAINER Roger Barthelson LABEL Description="This image is used for running tophat as part of the HTProcess pipeline"
RUN apt-get -y update
RUN apt-get -y install unzip && apt-get -y install python
ADD https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz ./
RUN tar xvzf tophat-2.1.1.Linux_x86_64.tar.gz && chmod -R a+x tophat-2.1.1.Linux_x86_64/* && cp -r tophat-2.1.1.Linux_x86_64/* /usr/local/bin
ADD https://github.com/azroger/HTProcess-Pipeline/archive/0.0.3.tar.gz ./
RUN tar xvzf 0.0.3.tar.gz && chmod a+x HTProcess-Pipeline-0.0.3/HTprocess_tophat.sh && cp -r HTProcess-Pipeline-0.0.3/HTprocess_tophat.sh /usr/bin
ADD https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip/download ./
RUN unzip download && chmod -R a+x bowtie2-2.2.9 && cp -r  bowtie2-2.2.9/* /usr/local/bin
#ADD https://sourceforge.net/projects/samtools/files/samtools/1.3.1/samtools-1.3.1.tar.bz2/download ./
RUN apt-get -y install samtools
#RUN tar xvjf download && cd samtools-1.3.1 && ./configure --without-curses && make && chmod -R a+x ./* && cp -rn ./* /usr/bin
ENTRYPOINT [ "HTprocess_tophat.sh" ] 
