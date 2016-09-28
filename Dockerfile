<<<<<<< HEAD
FROM ubuntu:14.02
MAINTAINER Nilesh 'nnilesh7756@gmail.com'
=======
FROM nilesh7756/puppetserver-docker:1.0
>>>>>>> f3443b888fb7195091bb9ec7745a9882cacde437

ENV PUPPET_SERVER_VERSION="2.6.0" DUMB_INIT_VERSION="1.0.2" UBUNTU_CODENAME="xenial" PUPPETSERVER_JAVA_ARGS="-Xms256m -Xmx256m" PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb --no-check-certificate && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_"1.0.2"_amd64.deb && \
    dpkg -i puppetlabs-release-pc1-trusty.deb && \
    dpkg -i dumb-init_1.0.2_amd64.deb && \
    rm puppetlabs-release-pc1-trusty.deb dumb-init_1.0.2_amd64.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppetserver=2.6.0-1puppetlabs1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY puppetserver /etc/default/puppetserver

RUN puppet config set autosign true --section master

VOLUME /etc/puppetlabs/code/

COPY docker-entrypoint.sh /

EXPOSE 8140

ENTRYPOINT ["dumb-init", "/docker-entrypoint.sh"]

CMD ["foreground" ]

COPY Dockerfile /

