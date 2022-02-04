FROM golang AS builder

RUN go install github.com/gqlgo/gqlint@latest


FROM cimg/node:17.2-browsers

ARG HOME=/home/circleci

COPY --from=builder /go/bin/gqlint ${HOME}/bin/
RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=${HOME}
ENV PATH=${HOME}/bin:${HOME}/google-cloud-sdk/bin:${HOME}/google-cloud-sdk/platform/google_appengine:$PATH

