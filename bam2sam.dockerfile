######################################################
# Dockerfile to build Sam2SortedBam -- Samtools 0.1.19 container images
# Based on Ubuntu
#####################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Roger Barthelson <rogerab@cyverse.org>

# Update the repository sources list and install samtools package
RUN apt-get update && apt-get -y install samtools=0.1.19-1  && apt-get clean
ADD https://github.com/azroger/cyverse_basic_scripts1/archive/1.0.5.tar.gz /
RUN tar xvzf /1.0.5.tar.gz && chmod a+x /cyverse_basic_scripts1-1.0.5/Sam2SortedBam.sh && cp /cyverse_basic_scripts1-1.0.5/Sam2SortedBam.sh /usr/bin
ENTRYPOINT [ "Sam2SortedBam.sh" ]
