FROM ubuntu:latest
MAINTAINER Eric Van Hensbergen <ericvh@gmail.com>

# get dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev swig\
    python3-dev python3-six python-is-python3 doxygen libboost-all-dev \
    libhdf5-serial-dev python3-pydot libpng-dev libelf-dev pkg-config pip \
    python3-venv
RUN apt-get clean

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN git clone https://github.com/gem5/gem5.git
# build it
WORKDIR /usr/local/src/gem5
ADD build.bash /usr/local/src/gem5/build.bash
RUN chmod ugo+x build.bash
RUN ./build.bash
ENTRYPOINT bash
