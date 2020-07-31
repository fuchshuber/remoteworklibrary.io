FROM gitpod/workspace-full:commit-d4b22db1963f969bcb30caed505c89b5e767a52d

USER root

# setup google-cloud-sdk installation
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# install ubuntu packages
RUN apt-get update && apt-get install -y \
        imagemagick=8:6.9.10.23+dfsg-2.1ubuntu11 \
        google-cloud-sdk=303.0.0-0 \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# install hugo version 0.74.3
RUN brew install https://raw.githubusercontent.com/Homebrew/linuxbrew-core/4670c3fdc5373311f3fe802d0db0976ff5a0d254/Formula/hugo.rb

USER gitpod
