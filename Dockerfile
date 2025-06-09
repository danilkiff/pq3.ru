FROM ubuntu:22.04

ARG HUGO_VERSION=0.147.7
ARG GO_VERSION=1.22.4

RUN ARCH=$(dpkg --print-architecture) \
  && apt-get update \
  && apt-get install -y curl ca-certificates libsass1 git \
  && curl -LO https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz \
  && tar -C /usr/local -xzf go${GO_VERSION}.linux-${ARCH}.tar.gz \
  && export PATH=$PATH:/usr/local/go/bin \
  && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${ARCH}.deb -o /tmp/hugo.deb \
  && apt-get install -y /tmp/hugo.deb \
  && rm /tmp/hugo.deb go${GO_VERSION}.linux-${ARCH}.tar.gz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /src

EXPOSE 1313

ENV HUGO_ENV=development

CMD ["hugo", "server", "--bind=0.0.0.0", "--baseURL=http://localhost:1313", "--appendPort=false", "--noHTTPCache"]
