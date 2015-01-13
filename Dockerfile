#
# Salt Stack Salt Master Container
#

FROM ubuntu:14.04
MAINTAINER Arne Schauf <docker@asmaps.de>

ENV DEBIAN_FRONTEND noninteractive

# Update System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Add PPA

RUN apt-get install -y software-properties-common python-git
RUN add-apt-repository -y ppa:saltstack/salt
RUN apt-get update

# Install Salt

RUN apt-get install -y salt-master=2014.7.0+ds-2trusty1

# Volumes

VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/log/salt', '/etc/salt/master.d', '/srv/salt']

# Add Run File

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Ports

EXPOSE 4505 4506

# Run Command

CMD "/usr/local/bin/run.sh"
