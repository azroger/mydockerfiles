# Transcoder VERSION 2.0.1
#
FROM gcc:5.1 
MAINTAINER Roger Barthelson LABEL Description="This image is used for running TransDecoder with EOD"
RUN apt-get -y install wget 
RUN wget https://github.com/TransDecoder/TransDecoder/archive/2.0.1.tar.gz && tar xvzf 2.0.1.tar.gz \
&& cd TransDecoder-2.0.1 && make && chmod a+x TransDecoder.* && cp TransDecoder.* /usr/bin/ && cp PerlLib/*.pm /usr/lib/perl5 && cp -r util /usr/bin
RUN wget http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-1.40.tar.gz && tar xvzf URI-1.40.tar.gz && cd URI-1.40 && perl Makefile.PL && make && cp -r URI /usr/lib/perl5
#ENTRYPOINT [ "TransDecoder.LongOrfs" ]
#ENTRYPOINT [ "TransDecoder.Predict" ]
RUN wget http://de.iplantcollaborative.org/dl/d/2A8B3FB9-780C-4839-B5C4-6CEDFAD3BD6D/run_transcoder2.sh && chmod a+x run_transcoder2.sh && cp run_transcoder2.sh /usr/bin
ENTRYPOINT [ "run_transcoder2.sh" ]
