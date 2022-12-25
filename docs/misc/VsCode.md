## VIM相关设置

```json
{
  "vim.easymotion": true,
  "vim.hlsearch": true,
  "vim.leader": "space",
  "vim.argumentObjectClosingDelimiters": [")", "]", "}"],
  "vim.argumentObjectOpeningDelimiters": ["(", "[", "{"],
  "vim.commandLineModeKeyBindings": [],
  "vim.normalModeKeyBindings": [
    {
      "before": ["<leader>", "s", "l"],
      "commands": [":vsplit"]
    },
    {
      "before": ["S"],
      "commands": [":w"]
    },
    {
      "before": ["Q"],
      "commands": [":q"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<c-j>"],
      "after": ["5", "j"]
    },
    {
      "before": ["<c-k>"],
      "after": ["5", "k"]
    },
    {
      "before": ["<leader>", "w", "h"],
      "after": ["<c-w>", "h"]
    },
    {
      "before": ["<leader>", "w", "l"],
      "after": ["<c-w>", "l"]
    }
  ],
  "vim.visualModeKeyBindingsNonRecursive": [
    {
      "before": ["<c-j>"],
      "after": ["5", "j"]
    },
    {
      "before": ["<c-k>"],
      "after": ["5", "k"]
    }
  ],
  "vim.insertModeKeyBindingsNonRecursive": [],
  "vim.sneak": true,
  "vim.sneakReplacesF": true,
  "vim.useSystemClipboard": true,
  "vim.insertModeKeyBindings": []
}
```
