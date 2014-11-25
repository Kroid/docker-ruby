# ruby 2.1.3
FROM ubuntu:14.04

MAINTAINER George M Kroid "kroid@yandex.ru"

ENV REFRESHED_AT 2014-11-25

RUN apt-get update
RUN apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs subversion
RUN apt-get install -y wget git

# install ruby from source
RUN mkdir -p /root
WORKDIR /root
RUN wget ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz
RUN tar xvfz ruby-2.1.3.tar.gz
WORKDIR /root/ruby-2.1.3
RUN ./configure
RUN make
RUN make install

# clean source files
WORKDIR /
RUN rm -rf /root/ruby-2.1.3
RUN rm /root/ruby-2.1.3.tar.gz

# update gems
RUN gem update --system
RUN gem install bundler

