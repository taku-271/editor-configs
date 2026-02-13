FROM debian:bookworm-slim

# 依存パッケージのインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  bash \
  build-essential \
  git \
  openssh-client \
  ripgrep \
  xclip \
  unzip \
  ca-certificates \
  docker.io \
  gnupg \
  && rm -rf /var/lib/apt/lists/*

# Docker Composeのインストール
RUN install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
  && chmod a+r /etc/apt/keyrings/docker.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update -y \
  && apt-get install -y docker-ce-cli

# Node.js最新版のインストール
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

# Pythonのインストール
RUN apt-get update && apt-get install -y python3 python3-pip \
  && pip install --break-system-packages pynvim

# Neovim最新版のインストール
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz \
  && tar xzf nvim-linux-arm64.tar.gz -C /opt \
  && ln -s /opt/nvim-linux-arm64/bin/nvim /usr/local/bin/nvim \
  && rm nvim-linux-arm64.tar.gz

# lazygitのインストール
RUN LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name":' | sed 's/.*"v\([^"]*\)".*/\1/') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz" \
  && tar xzf lazygit.tar.gz lazygit \
  && install lazygit /usr/local/bin \
  && rm lazygit lazygit.tar.gz

# Claude Code，DevContainersのインストール
RUN npm install -g @anthropic-ai/claude-code @devcontainers/cli

# DevContainers用のaliasを設定
RUN echo "alias dc='devcontainer up --workspace-folder . && devcontainer exec bash'" >> /root/.bashrc

# GitHubのSSHホストキーを事前登録
RUN mkdir -p /root/.ssh \
  && ssh-keyscan github.com >> /root/.ssh/known_hosts 2>/dev/null

ENV PATH="/root/.local/share/nvim/mason/bin:${PATH}"

CMD ["nvim", "+TSUpdate", "."]
