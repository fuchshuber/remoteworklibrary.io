FROM gitpod/workspace-full

RUN sudo apt-get update \
    && sudo apt-get install -y \
        apt-get install hugo \
    && rm -rf /var/lib/apt/lists/*

RUN brew install hugo@0.74.3