FROM buildpack-deps:wheezy

MAINTAINER George M Kroid "kroid@yandex.ru"

# node.js
RUN curl -sL https://deb.nodesource.com/setup | bash - && apt-get install -y nodejs

# rubu 2.1.3
## install ruby from source
RUN mkdir -p /root
WORKDIR /root
RUN wget ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz
RUN tar xvfz ruby-2.1.3.tar.gz
WORKDIR /root/ruby-2.1.3
RUN ./configure
RUN make
RUN make install

## clean source files
WORKDIR /
RUN rm -rf /root/ruby-2.1.3
RUN rm /root/ruby-2.1.3.tar.gz

## gems
RUN gem update --system
RUN gem install bundler
