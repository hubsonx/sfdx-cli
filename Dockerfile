# node > 14.6.0 is required for the SFDX-Git-Delta plugin
FROM node:lts-alpine

#add usefull tools
RUN apk add --update --no-cache  \
      git \
      findutils \
      bash \
      unzip \
      curl \
      wget \
      npm \
      openjdk8-jre \
      openssh-client \
      perl \
      jq

# install Salesforce CLI from npm
ENV PATH="/node_modules/.bin:${PATH}"

# Install npm packages +install sfdx plugins & display versions
RUN npm install --no-cache @salesforce/cli -g && \
    echo 'y' | sf plugins:install sfdx-git-delta && \
    sf --version && \
    sf plugins && \
    rm -rf /root/.npm/_cacache

