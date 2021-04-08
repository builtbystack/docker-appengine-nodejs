FROM circleci/node:14-browsers-legacy

ARG HOME=/home/circleci

RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=${HOME}
ENV PATH=${HOME}/google-cloud-sdk/bin:${HOME}/google-cloud-sdk/platform/google_appengine:$PATH

