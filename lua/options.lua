local opt = vim.opt

-- 行番号の表示
opt.number = true

-- 相対行番号を表示
opt.relativenumber = true

-- タブ数を2にする
opt.tabstop = 2
opt.shiftwidth = 2

-- タブをスペースに置き換える
opt.expandtab = true

-- 新しい行にインデントをつける
opt.autoindent = true

-- 検索時に大文字小文字に区別をつけない
opt.ignorecase = true

-- 検索時に大文字が含まれる時のみ区別する
opt.smartcase = true

opt.cursorline = true

-- クリップボードを共有
opt.clipboard:append{"unnamedplus"}

