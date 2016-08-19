# rsem-calc-express
FROM   gcc:5.1
MAINTAINER  Roger Barthelson rogerab@email.arizona.edu
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN git clone https://github.com/deweylab/RSEM.git && cd RSEM && make && chmod a+x ./* && cp -r ./* /usr/bin
RUN wget http://de.iplantcollaborative.org/dl/d/B5B1B725-BE04-4581-B51A-8735CB9CE611/list.txt
RUN cat list.txt | cpanm
ENTRYPOINT [ "rsem-calculate-expression" ]

