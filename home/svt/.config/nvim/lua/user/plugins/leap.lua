return {
  config = function ()
    require("leap").setup {
      safe_labels = {
        "a", "r", "s", "t", "g", "k", "n", "e",
      },
      labels = {
        "a", "r", "s", "t", "g", "k", "n", "e", "i", "o"
      },
    }

  end
}
