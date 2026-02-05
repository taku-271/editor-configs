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
  && rm -rf /var/lib/apt/lists/*

# Node.js最新版のインストール
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

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

# Claude Codeのインストール
RUN npm install -g @anthropic-ai/claude-code

ENV PATH="/root/.local/share/nvim/mason/bin:${PATH}"

WORKDIR /workspace
CMD ["nvim", "."]
