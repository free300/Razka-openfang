FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download & install OpenFang binary
RUN curl -fsSL https://openfang.sh/install | sh

# Copy skill files kamu
COPY skills/ /root/.openfang/skills/

# Copy config
COPY openfang.toml /root/.openfang/openfang.toml

EXPOSE 4200

CMD ["openfang", "start"]
