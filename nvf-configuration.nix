{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;
    options = {
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      shiftwidth = 2;
    };
    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    # keymaps = [
    #   # Da solte ich mal reinschauen:
    #   # https://notashelf.github.io/nvf/options.html#opt-vim.keymaps
    #   # https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
    # ];

    spellcheck = {
      enable = true;
    };

    lsp = {
      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    lsp.enable = true;
    # This section does not include a comprehensive list of available language modules.
    # To list all available language module options, please visit the nvf manual.
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      # Languages that will be supported in default and maximal configurations.
      nix.enable = true;
      markdown.enable = true;

      # Languages that are enabled in the maximal configuration.
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      fsharp.enable = true;
      html.enable = true;
      sql.enable = true;
      java.enable = true;
      kotlin.enable = true;
      ts.enable = true;
      go.enable = false;
      lua.enable = true;
      zig.enable = false;
      python.enable = false;
      typst.enable = false;
      rust = {
        enable = true;
        crates.enable = true;
      };

      # Language modules that are not as common.
      assembly.enable = false;
      astro.enable = false;
      nu.enable = false;
      csharp.enable = false;
      julia.enable = false;
      vala.enable = false;
      scala.enable = true;
      r.enable = false;
      gleam.enable = true;
      dart.enable = false;
      ocaml.enable = false;
      elixir.enable = false;
      haskell = {
        enable = true;
        # lsp.enable = true;
      };
      ruby.enable = false;

      tailwind.enable = false;
      svelte.enable = false;

      # Nim LSP is broken on Darwin and therefore
      # should be disabled by default. Users may still enable
      # `vim.languages.vim` to enable it, this does not restrict
      # that.
      # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
      nim.enable = false;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim = {
        enable = true;
        setupOpts.keymaps = {
          basic = true;
          extra = true;
        };
      };
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;

      # Fun
      cellular-automaton.enable = false;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "tokyonight";
      };
    };

    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
      transparent = true;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete.nvim-cmp.enable = true;
    # autocomplete.nvim-cmp.mappings.complete = "<tab>";
    autocomplete.nvim-cmp.setupOpts.completion.completeopt = "menu,menuone,noinsert,noselect";
    snippets.luasnip.enable = true;

    filetree = {
      neo-tree = {
        enable = true;
      };
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope = {
      enable = true;
      mappings.findFiles = "<tab>";
      setupOpts.defaults.layout_config.horizontal.prompt_position = "bottom";
    };
    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = false; # throws an annoying debug message
        mappings = {
          blameLine = "<leader>gl";
          nextHunk = "<leader>gn";
          previewHunk = "<leader>gh";
          previousHunk = "<leader>gb";
          resetBuffer = "<leader>gR";
          resetHunk = "<leader>gr";
          stageBuffer = "<leader>gS";
          stageHunk = "<leader>gs";
          undoStageHunk = "<leader>gu";
        };
      };
    };

    minimap = {
      minimap-vim.enable = false;
      codewindow.enable = true; # lighter, faster, and uses lua for configuration
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      icon-picker.enable = true;
      surround.enable = true;
      leetcode-nvim.enable = true;
      multicursors.enable = true;

      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = false;
      };
      images = {
        image-nvim.enable = false;
      };
    };

    notes = {
      obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
      neorg.enable = false;
      orgmode.enable = false;
      mind-nvim.enable = true;
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = true; # the theme looks terrible with catppuccin
      illuminate.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
    };

    session = {
      nvim-session-manager.enable = false;
    };

    gestures = {
      gesture-nvim.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = true;
    };
  };
}
