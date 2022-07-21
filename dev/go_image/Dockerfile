FROM debian:stable-slim

# ATT PACKAGES AND INSTALL WGET
RUN apt update -y && \
    apt upgrade -y && \
    apt install curl -y

# INSTALL GO
RUN cd /tmp && \
    curl -sSfL https://dl.google.com/go/go1.18.4.linux-amd64.tar.gz --output ./go.tar && \
    tar -C /usr/local -xzf go.tar && \
    chmod +x /usr/local/go

# SETTING UP GO TO PATH
ENV PATH=$PATH:/usr/local/go/bin
# ENV GOPATH=/usr/local/go

# INSTALL AIR
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/local/go/bin

# SET WORKING DIRECTORY
WORKDIR /air

# START THE CONTAINER
ENTRYPOINT ["air"]