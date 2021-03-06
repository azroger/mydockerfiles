# RSEM


FROM   gcc:5.1
MAINTAINER Roger Barthelson

LABEL Description="This image is used for running RSEM RNA-Seq analysis tools "
RUN git clone https://github.com/deweylab/RSEM.git && cd RSEM && make && chmod a+x && cp -r ./* /usr/bin
ENTRYPOINT ["rsem-prepare-reference"]
