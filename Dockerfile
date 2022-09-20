FROM golang AS builder

RUN go install github.com/gqlgo/gqlint@latest
RUN go install github.com/gqlgo/lackid/cmd/lackid@v0.1.2
RUN go install github.com/gqlgo/deprecatedquery/cmd/deprecatedquery@v0.0.3
RUN go install github.com/gqlgo/querystring@latest


FROM cimg/node:17.2-browsers

ARG HOME=/home/circleci

COPY --from=builder /go/bin/* ${HOME}/bin/
RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=${HOME} && \
    sudo npm install -g get-graphql-schema

ENV PATH=${HOME}/bin:${HOME}/google-cloud-sdk/bin:${HOME}/google-cloud-sdk/platform/google_appengine:$PATH

