#
# create a 
#

FROM ubuntu

MAINTAINER lutz.behnke@informatik.haw-hamburg.de

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install erlang-base-hipe erlang-crypt

