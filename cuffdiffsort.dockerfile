# CuffDiff Sort 
# VERSION               1.0.0
# 

FROM      ubuntu:14.04.3 
MAINTAINER Roger Barthelson

LABEL Description="This image is used for running cuffdiff_sort.sh to sort cuffdiff outputs"

RUN apt-get -y install wget
RUN wget http://de.iplantcollaborative.org/dl/d/CFE77C75-8831-49EF-93B2-65A94B0DD5A8/cuffdiff_sort.sh
RUN chmod a+x cuffdiff_sort.sh
RUN cp cuffdiff_sort.sh /usr/bin
ENTRYPOINT ["cuffdiff_sort.sh"]
