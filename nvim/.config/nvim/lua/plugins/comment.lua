return {
  {
    event = "VeryLazy",
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    event = "VeryLazy",
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end
  }
}
