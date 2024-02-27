local tmp = {
  cmdline = {
    enabled = true,
    format = {
      calculator = {
        conceal = true,
        icon = "",
        icon_hl_group = "NoiceCmdlineIconCalculator",
        kind = "calculator",
        lang = "vimnormal",
        opts = {
          border = {
            text = {
              top = " Calculator "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderCalculator"
            }
          }
        },
        pattern = "^=",
        view = "cmdline_popup"
      },
      cmdline = {
        conceal = true,
        icon = "",
        icon_hl_group = "NoiceCmdlineIconCmdline",
        kind = "cmdline",
        lang = "vim",
        opts = {
          border = {
            text = {
              top = " Cmdline "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderCmdline"
            }
          }
        },
        pattern = "^:",
        view = "cmdline_popup"
      },
      filter = {
        conceal = true,
        icon = "$",
        icon_hl_group = "NoiceCmdlineIconFilter",
        kind = "filter",
        lang = "bash",
        opts = {
          border = {
            text = {
              top = " Filter "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderFilter"
            }
          }
        },
        pattern = "^:%s*!",
        view = "cmdline_popup"
      },
      help = {
        conceal = true,
        icon = "",
        icon_hl_group = "NoiceCmdlineIconHelp",
        kind = "help",
        opts = {
          border = {
            text = {
              top = " Help "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderHelp"
            }
          }
        },
        pattern = "^:%s*he?l?p?%s+",
        view = "cmdline_popup"
      },
      input = {
        conceal = true,
        icon_hl_group = "NoiceCmdlineIconInput",
        kind = "input",
        opts = {
          border = {
            text = {
              top = " Input "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderInput"
            }
          }
        },
        view = "cmdline_popup"
      },
      lua = {
        conceal = true,
        icon = "",
        icon_hl_group = "NoiceCmdlineIconLua",
        kind = "lua",
        lang = "lua",
        opts = {
          border = {
            text = {
              top = " Lua "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderLua"
            }
          }
        },
        pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
        view = "cmdline_popup"
      },
      search_down = {
        conceal = true,
        icon = " ",
        icon_hl_group = "NoiceCmdlineIconSearch",
        kind = "search",
        lang = "regex",
        opts = {
          border = {
            text = {
              top = " Search "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderSearch"
            }
          }
        },
        pattern = "^/",
        view = "cmdline"
      },
      search_up = {
        conceal = true,
        icon = " ",
        icon_hl_group = "NoiceCmdlineIconSearch",
        kind = "search",
        lang = "regex",
        opts = {
          border = {
            text = {
              top = " Search "
            }
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoiceCmdlinePopupBorderSearch"
            }
          }
        },
        pattern = "^%?",
        view = "cmdline"
      }
    },
    opts = {},
    view = "cmdline_popup"
  },
  commands = {
    errors = {
      filter = {
        error = true
      },
      filter_opts = {
        reverse = true
      },
      opts = {
        enter = true,
        format = "details"
      },
      view = "popup"
    },
    history = {
      filter = {
        any = { {
            event = "notify"
          }, {
            error = true
          }, {
            warning = true
          }, {
            event = "msg_show",
            kind = { "" }
          }, {
            event = "lsp",
            kind = "message"
          } }
      },
      opts = {
        enter = true,
        format = "details"
      },
      view = "split"
    },
    last = {
      filter = {
        any = { {
            event = "notify"
          }, {
            error = true
          }, {
            warning = true
          }, {
            event = "msg_show",
            kind = { "" }
          }, {
            event = "lsp",
            kind = "message"
          } }
      },
      filter_opts = {
        count = 1
      },
      opts = {
        enter = true,
        format = "details"
      },
      view = "popup"
    }
  },
  debug = false,
  format = {
    cmdline = {},
    confirm = {
      hl_group = {
        choice = "NoiceFormatConfirm",
        default_choice = "NoiceFormatConfirmDefault"
      }
    },
    data = {},
    date = {
      format = "%X",
      hl_group = "NoiceFormatDate"
    },
    debug = {
      enabled = true
    },
    event = {
      hl_group = "NoiceFormatEvent"
    },
    kind = {
      hl_group = "NoiceFormatKind"
    },
    level = {
      hl_group = {
        debug = "NoiceFormatLevelDebug",
        error = "NoiceFormatLevelError",
        info = "NoiceFormatLevelInfo",
        off = "NoiceFormatLevelOff",
        trace = "NoiceFormatLevelTrace",
        warn = "NoiceFormatLevelWarn"
      },
      icons = {
        error = " ",
        info = " ",
        warn = " "
      }
    },
    message = {},
    progress = {
      align = "right",
      contents = {},
      hl_group = "NoiceFormatProgressTodo",
      hl_group_done = "NoiceFormatProgressDone",
      key = "progress",
      width = 20
    },
    spinner = {
      name = "dots"
    },
    text = {},
    title = {
      hl_group = "NoiceFormatTitle"
    }
  },
  health = {
    checker = true
  },
  log = "/Users/nathanaelchwojko-srawkey/.local/state/nvim/noice.log",
  log_max_size = 2097152,
  lsp = {
    documentation = {
      opts = {
        format = { "{message}" },
        render = "plain",
        replace = true,
        win_options = {
          concealcursor = "n",
          conceallevel = 3
        }
      },
      view = "hover"
    },
    hover = {
      enabled = true,
      opts = {},
      silent = false
    },
    message = {
      enabled = true,
      opts = {},
      view = "notify"
    },
    override = {
      ["cmp.entry.get_documentation"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true
    },
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 33.333333333333,
      view = "mini"
    },
    signature = {
      auto_open = {
        enabled = true,
        luasnip = true,
        throttle = 50,
        trigger = true
      },
      enabled = true,
      opts = {}
    }
  },
  markdown = {
    highlights = {
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
      ["|%S-|"] = "@text.reference"
    },
    hover = {
      ["%[.-%]%((%S-)%)"] = 'FUNCTION',
      ["|(%S-)|"] = 'FUNCTION'
    }
  },
  messages = {
    enabled = true,
    view = "mini",
    view_error = "notify",
    view_history = "messages",
    view_search = "virtualtext",
    view_warn = "notify"
  },
  notify = {
    enabled = true,
    view = "notify"
  },
  popupmenu = {
    backend = "nui",
    enabled = true,
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = "了 ",
      EnumMember = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Keyword = " ",
      Method = "ƒ ",
      Module = " ",
      Property = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      Unit = " ",
      Value = " ",
      Variable = " "
    }
  },
  presets = {
    bottom_search = false,
    cmdline_output_to_split = false,
    command_palette = false,
    inc_rename = false,
    long_message_to_split = true,
    lsp_doc_border = true
  },
  redirect = {
    filter = {
      event = "msg_show"
    },
    view = "popup"
  },
  routes = { {
      filter = {
        event = "msg_showmode"
      },
      view = "mini"
    }, {
      filter = {
        event = "lsp",
        find = "file"
      },
      opts = {
        skip = true
      }
    }, {
      filter = {
        event = "msg_showmode",
        find = "INSERT"
      },
      opts = {
        skip = true
      }
    }, {
      filter = {
        event = "msg_show",
        min_height = 20
      },
      view = "cmdline_output"
    }, {
      filter = {
        event = "cmdline",
        kind = "input"
      },
      opts = <table 5>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "cmdline",
        kind = "filter"
      },
      opts = <table 3>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "cmdline",
        kind = "search"
      },
      opts = <table 8>,
      view = "cmdline"
    }, {
      filter = {
        event = "cmdline",
        kind = "cmdline"
      },
      opts = <table 2>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "cmdline",
        kind = "calculator"
      },
      opts = <table 1>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "cmdline",
        kind = "search"
      },
      opts = <table 7>,
      view = "cmdline"
    }, {
      filter = {
        event = "cmdline",
        kind = "lua"
      },
      opts = <table 6>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "cmdline",
        kind = "help"
      },
      opts = <table 4>,
      view = "cmdline_popup"
    }, {
      filter = {
        event = "lsp",
        kind = "signature"
      },
      opts = {
        format = <table 10>,
        render = "plain",
        replace = true,
        win_options = <table 11>
      },
      view = "hover"
    }, {
      filter = {
        event = "lsp",
        kind = "hover"
      },
      opts = {
        format = <table 10>,
        render = "plain",
        replace = true,
        win_options = <table 11>
      },
      view = "hover"
    }, {
      filter = {
        event = "cmdline"
      },
      opts = <table 9>,
      view = "cmdline_popup"
    }, {
      filter = {
        any = { {
            event = "msg_show",
            kind = "confirm"
          }, {
            event = "msg_show",
            kind = "confirm_sub"
          } }
      },
      view = "confirm"
    }, {
      filter = {
        any = { {
            event = "msg_history_show"
          } }
      },
      view = "messages"
    }, {
      filter = {
        event = "msg_show",
        kind = "search_count"
      },
      view = "virtualtext"
    }, {
      filter = {
        any = { {
            event = { "msg_showmode", "msg_showcmd", "msg_ruler" }
          }, {
            event = "msg_show",
            kind = "search_count"
          } }
      },
      opts = {
        skip = true
      }
    }, {
      filter = {
        event = "msg_show",
        kind = { "", "echo", "echomsg" }
      },
      opts = {
        merge = true,
        replace = true,
        title = "Messages"
      },
      view = "mini"
    }, {
      filter = {
        error = true
      },
      opts = {
        title = "Error"
      },
      view = "notify"
    }, {
      filter = {
        warning = true
      },
      opts = {
        title = "Warning"
      },
      view = "notify"
    }, {
      filter = {
        event = "notify"
      },
      opts = {
        title = "Notify"
      },
      view = "notify"
    }, {
      filter = {
        event = "noice",
        kind = { "stats", "debug" }
      },
      opts = {
        lang = "lua",
        replace = true,
        title = "Noice"
      },
      view = "notify"
    }, {
      filter = {
        event = "lsp",
        kind = "progress"
      },
      view = "mini"
    }, {
      filter = {
        event = "lsp",
        kind = "message"
      },
      opts = <table 12>,
      view = "notify"
    } },
  smart_move = {
    enabled = true,
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" }
  },
  status = {
    command = {
      event = "msg_showcmd"
    },
    message = {
      event = "msg_show"
    },
    mode = {
      event = "msg_showmode"
    },
    ruler = {
      event = "msg_ruler"
    },
    search = {
      event = "msg_show",
      kind = "search_count"
    }
  },
  throttle = 33.333333333333,
  views = {
    cmdline = {
      backend = "popup",
      border = {
        style = "none"
      },
      position = {
        col = 0,
        row = "100%"
      },
      relative = "editor",
      size = {
        height = "auto",
        width = "100%"
      },
      win_options = {
        winhighlight = {
          CurSearch = "",
          IncSearch = "",
          Normal = "NoiceCmdline",
          Search = ""
        }
      }
    },
    cmdline_output = {
      format = "details",
      view = "split"
    },
    cmdline_popup = {
      backend = "popup",
      border = {
        padding = { 0, 1 },
        style = "rounded"
      },
      enter = false,
      focusable = false,
      position = {
        col = "50%",
        row = 5
      },
      relative = "editor",
      size = {
        height = "auto",
        min_width = 60,
        width = 60
      },
      win_options = {
        cursorline = false,
        foldenable = false,
        winbar = "",
        winhighlight = {
          CurSearch = "",
          FloatBorder = "NoiceCmdlinePopupBorder",
          FloatTitle = "NoiceCmdlinePopupTitle",
          IncSearch = "",
          Normal = "NoiceCmdlinePopup",
          Search = ""
        }
      },
      zindex = 200
    },
    cmdline_popupmenu = {
      view = "popupmenu",
      zindex = 200
    },
    confirm = {
      align = "center",
      backend = "popup",
      border = {
        padding = { 0, 1 },
        style = "rounded",
        text = {
          top = " Confirm "
        }
      },
      enter = false,
      focusable = false,
      format = { "{confirm}" },
      position = {
        col = "50%",
        row = "50%"
      },
      relative = "editor",
      size = "auto",
      win_options = {
        foldenable = false,
        winbar = "",
        winhighlight = {
          FloatBorder = "NoiceConfirmBorder",
          Normal = "NoiceConfirm"
        }
      },
      zindex = 210
    },
    hover = {
      anchor = "auto",
      border = {
        padding = { 0, 2 },
        style = "rounded"
      },
      enter = false,
      position = {
        col = 2,
        row = 2
      },
      relative = "cursor",
      size = {
        height = "auto",
        max_height = 20,
        max_width = 120,
        width = "auto"
      },
      view = "popup",
      win_options = {
        linebreak = true,
        wrap = true
      },
      zindex = 45
    },
    messages = {
      enter = true,
      view = "split"
    },
    mini = {
      align = "message-right",
      backend = "mini",
      border = {
        style = "none"
      },
      focusable = false,
      position = {
        col = "100%",
        row = -1
      },
      relative = "editor",
      reverse = true,
      size = "auto",
      timeout = 2000,
      win_options = {
        foldenable = false,
        winbar = "",
        winblend = 30,
        winhighlight = {
          CurSearch = "",
          IncSearch = "",
          Normal = "NoiceMini",
          Search = ""
        }
      },
      zindex = 60
    },
    notify = {
      backend = "notify",
      fallback = "mini",
      format = "notify",
      merge = false,
      replace = false
    },
    popup = {
      backend = "popup",
      border = {
        style = "rounded"
      },
      close = {
        events = { "BufLeave" },
        keys = { "q" }
      },
      enter = true,
      position = "50%",
      relative = "editor",
      size = {
        height = "20",
        width = "120"
      },
      win_options = {
        foldenable = false,
        winbar = "",
        winhighlight = {
          FloatBorder = "NoicePopupBorder",
          Normal = "NoicePopup"
        }
      }
    },
    popupmenu = {
      backend = "cmp",
      border = {
        padding = { 0, 1 },
        style = "rounded"
      },
      position = {
        col = "50%",
        row = 8
      },
      relative = "editor",
      size = {
        height = 10,
        max_height = 20,
        width = 60
      },
      win_options = {
        cursorline = true,
        cursorlineopt = "line",
        foldenable = false,
        winbar = "",
        winhighlight = {
          CursorLine = "NoicePopupmenuSelected",
          FloatBorder = "DiagnosticInfo",
          Normal = "Normal",
          PmenuMatch = "NoicePopupmenuMatch"
        }
      },
      zindex = 65
    },
    split = {
      backend = "split",
      close = {
        keys = { "q" }
      },
      enter = false,
      position = "bottom",
      relative = "editor",
      size = "20%",
      win_options = {
        winhighlight = {
          FloatBorder = "NoiceSplitBorder",
          Normal = "NoiceSplit"
        },
        wrap = true
      }
    },
    virtualtext = {
      backend = "virtualtext",
      format = { "{message}" },
      hl_group = "NoiceVirtualText"
    },
    vsplit = {
      position = "right",
      view = "split"
    }
  }
}
