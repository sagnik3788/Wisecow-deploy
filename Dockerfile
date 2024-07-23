# base image
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Ensure cowsay and fortune are in PATH
ENV PATH="/usr/games:${PATH}"

WORKDIR /app

COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]