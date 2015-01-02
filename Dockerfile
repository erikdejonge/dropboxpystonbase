FROM    ubuntu:12.04
RUN     apt-get update
RUN     apt-get install -y wget
RUN     apt-get install -y build-essential
RUN     apt-get install -y git
RUN     mkdir ~/pyston_deps
RUN     git clone --recursive https://github.com/dropbox/pyston.git ~/pyston
RUN     apt-get install -y libgmp-dev libmpfr-dev libmpc-dev make build-essential libtool zip gcc-multilib autogen
WORKDIR /pyston_deps
RUN     wget 'http://www.netgull.com/gcc/releases/gcc-4.8.2/gcc-4.8.2.tar.bz2'
RUN     tar xf gcc-4.8.2.tar.bz2
RUN     mkdir gcc-4.8.2-{build,install}
WORKDIR gcc-4.8.2-build
RUN     ../gcc-4.8.2/configure --prefix=$HOME/pyston_deps/gcc-4.8.2-install
ENV     LIBRARY_PATH /usr/lib32
RUN     make -j4
RUN     make check
RUN     make install

