FROM registry.fedoraproject.org/fedora:latest

# Basic tools, npm, and utilities for agent repository operations
RUN dnf install -y --setopt=install_weak_deps=False \
    git \
    npm \
    ripgrep \
    && dnf clean all

# Install the latest OpenCode v2 globally via npm
RUN npm install -g @opencode/cli@latest \
    && npm cache clean --force

# Create the agent user with a fixed UID/GID of 1000
RUN groupadd -g 1000 agent \
    && useradd -m -u 1000 -g 1000 -s /bin/bash agent \
    && mkdir -p /home/agent/.config/opencode /home/agent/.local/share/opencode /home/agent/.local/state/opencode \
    && chown -R agent:agent /home/agent

USER agent
WORKDIR /home/agent

ENTRYPOINT ["opencode"]
