# Cuffdiff 2.2.1
#
FROM gcc:5.1 
MAINTAINER Roger Barthelson 
LABEL Description="This image is used for running Cuffdiff"
RUN git clone https://github.com/samtools/htslib.git && cd htslib && make && make install 
RUN git clone https://github.com/samtools/samtools.git && cd samtools && make && make install
RUN wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz && tar xvzf cufflinks-2.2.1.Linux_x86_64.tar.gz && cd cufflinks-2.2.1.Linux_x86_64 && cp cuf* /usr/bin && cp gffread /usr/bin && cp gtf_to_sam /usr/bin
RUN wget http://de.iplantcollaborative.org/dl/d/DA72F9C3-8005-4F9C-AFB8-D5165427BC87/munge_ids.pl && wget http://de.iplantcollaborative.org/dl/d/2EF5E68E-5E71-413A-8DCB-86C156ECDED9/cuffdiff_test16.pl
RUN wget http://de.iplantcollaborative.org/dl/d/07B1C95B-839C-472D-9DD1-08F840462E95/cuffdiff_sort.sh && wget http://de.iplantcollaborative.org/dl/d/739DA7EB-5BFF-40E3-8A75-2E817CF965D8/cuffdiff_fix_annotations.pl && chmod a+x *.pl
ENTRYPOINT [ "./cuffdiff_test16.pl" ]
