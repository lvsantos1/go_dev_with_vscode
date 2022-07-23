FROM debian:stable-slim

# ATT PACKAGES AND INSTALL HELPFUL
RUN apt update -y && \
    apt upgrade -y && \
    apt install curl -y && \
    apt install gcc -y && \
    apt install git -y && \
    apt install iproute2 -y && \
    apt install procps -y && \
    apt install lsb-release -y && \
    apt install make

# INSTALL GO
RUN cd /tmp && \
    curl -sSfL https://dl.google.com/go/go1.18.4.linux-amd64.tar.gz --output ./go.tar && \
    tar -C /usr/local -xzf go.tar && \
    chmod +x /usr/local/go

# SETTING UP GO TO PATH
ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# INSTALL AIR
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/local/go/bin

# INSTALL GO TOOLS.
RUN apt update -y \
    # INSTALL GOCODE-GOMOD.
    # && go install -x github.com/stamblerre/gocode@latest 2>&1 \
    # && go build -o gocode-gomod github.com/stamblerre/gocode \
    # && mv gocode-gomod $GOPATH/bin/ \
    # INSTALL OTHER TOOLS.
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install golang.org/x/tools/gopls@latest \
    && go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go install github.com/acroca/go-symbols@latest \
    && go install golang.org/x/tools/cmd/gorename@latest \
    && go install github.com/rogpeppe/godef@latest \
    && go install golang.org/x/tools/cmd/goimports@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@latest

# CLEAN UP
RUN apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# START THE CONTAINER
ENTRYPOINT ["tail", "-f", "/dev/null"]