FROM zcx2001/nodebuilder:latest

ENV PATH=/root/.nvm/versions/node/v16.20.0/bin/:$PATH

ADD maven/apache-maven-3.6.3-bin.tar.gz /opt

# github 上编译时不需要替换源
# sed -i -E 's/(archive|security|ports).ubuntu.(org|com)/mirrors.aliyun.com/g' /etc/apt/sources.list && \

RUN wget -q -O - https://download.bell-sw.com/pki/GPG-KEY-bellsoft | apt-key add - && \
    echo "deb https://apt.bell-sw.com/ stable main" | tee /etc/apt/sources.list.d/bellsoft.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y bellsoft-java8 && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash", "-c"]