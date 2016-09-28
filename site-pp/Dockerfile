FROM nilesh7756/puppetserver-docker:1.0
MAINTAINER Nilesh 'nnilesh7756@gmail.com'

COPY site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp

RUN puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
