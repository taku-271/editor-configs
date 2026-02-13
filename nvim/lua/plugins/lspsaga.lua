return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- 構文強調用
    'nvim-tree/nvim-web-devicons',     -- アイコン用
  },
  config = function()
    require('lspsaga').setup({
      -- ここにオプションを記述（後述）
      ui = {
        border = 'rounded', -- ウィンドウの枠線を丸くする
        code_action = '💡', -- コードアクションのアイコン
      },
    })
  end,
}
