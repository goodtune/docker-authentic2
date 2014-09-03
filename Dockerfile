FROM python:2
MAINTAINER Gary Reynolds <gary@touch.asn.au>

RUN apt-get update && apt-get autoremove -y
RUN apt-get install -y autoconf
RUN apt-get install -y automake
RUN apt-get install -y autotools-dev
RUN apt-get install -y libtool
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxmlsec1-dev
RUN apt-get install -y gtk-doc-tools
RUN apt-get clean

WORKDIR /usr/src
RUN curl --silent https://dev.entrouvert.org/lasso/lasso-2.4.1.tar.gz | tar xzvf -

WORKDIR lasso-2.4.1
RUN ./autogen.sh --disable-perl --enable-gtk-doc-html=no
RUN make install clean
RUN ldconfig

WORKDIR /usr/src
RUN pip install authentic2
