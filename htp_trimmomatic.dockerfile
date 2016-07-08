FROM java:7

MAINTAINER Roger Barthelson <rogerab@cyverse.org>



RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get -y install make

RUN wget -P /root http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.33.zip && unzip /root/Trimmomatic-0.33.zip -d /root

RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip && unzip fastqc_v0.10.1.zip && chmod a+x FastQC/fastqc && cp -r FastQC/* /usr/bin

RUN wget -O - http://cpanmin.us | perl - App::cpanminus && cpanm File::Slurp

RUN wget https://github.com/azroger/HTProcess-Pipeline/archive/0.0.3.tar.gz

RUN tar xvzf 0.0.3.tar.gz && chmod a+x HTProcess-Pipeline-0.0.3/* && cp HTProcess-Pipeline-0.0.3/* /usr/bin

ENV PATH "/root/Trimmomatic-0.33/adapters:$PATH"

ENTRYPOINT ["HTprocess_trim2.sh"]
