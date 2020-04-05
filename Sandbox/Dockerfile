FROM langelog/pytess:17feb20_django

#COPY ./kickup.sh /root/

WORKDIR /app

# install golang
RUN wget -c https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.14.1.linux-amd64.tar.gz && echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc

# install nasm
RUN apt-get install nasm less libxpm-dev -y

# install jupyter
RUN pip install jupyter

# Enable go in jupyter
RUN /bin/bash -c "source $HOME/.bashrc && env GO111MODULE=on go get github.com/gopherdata/gophernotes"
RUN mkdir -p $HOME/.local/share/jupyter/kernels/gophernotes
RUN ["/bin/bash", "-c", "source $HOME/.bashrc \
    && cd $HOME/.local/share/jupyter/kernels/gophernotes \
    && cp $(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.0/kernel/* . \
    && chmod +w ./kernel.json \
    && sed \"s|gophernotes|$(go env GOPATH)/bin/gophernotes|\" < kernel.json.in > kernel.json"]

# Compile Root from source
RUN cd $HOME \
    && wget -c https://root.cern/download/root_v6.20.04.source.tar.gz \
    && tar zxvf root_v6.20.04.source.tar.gz \
    && mkdir root && cd root \
    && cmake -DCMAKE_INSTALL_PREFIX=/opt/root ../root-6.20.04 \
    && cmake --build .

# Install Xeus-cling for c++ support in jupyter
#RUN cd $HOME \
#    && wget -c https://root.cern/download/root_v6.20.04.Linux-ubuntu19-x86_64-gcc8.3.tar.gz \
#    && tar zxvf root_v6.20.04.Linux-ubuntu19-x86_64-gcc8.3.tar.gz \
#    && echo "source $HOME/root/bin/thisroot.sh" >> $HOME/.bashrc

#RUN ["/bin/bash", "-c", "source $HOME/.bashrc \
#    && cp -r $ROOTSYS/etc/notebook/kernels/root $HOME/.local/share/jupyter/kernels"]

