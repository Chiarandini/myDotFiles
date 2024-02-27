--===================================================================
--||              _   __              _    ___                     ||
--||             / | / /__  ____     | |  / (_)___ ___             ||
--||            /  |/ / _ \/ __ \    | | / / / __ `__ \            ||
--||           / /|  /  __/ /_/ /    | |/ / / / / / / /            ||
--||          /_/ |_/\___/\____/     |___/_/_/ /_/ /_/             ||
--||                                                               ||
--===================================================================
-- Lua Documentation: https://www.lua.org/manual/5.4/
-- DON'T FORGET:  the following are _still_ treated as equivalent
-- <Tab> / <C-I>, <CR> / <C-M> , <Esc> / <C-[> etc. (Only exception is <BS> / <C-H>
-- ASCII art preference: ANSI Shadow and

--  ╔══════════════════════════════════════════════════════════╗
--  ║                     Fault Management                     ║
--  ╚══════════════════════════════════════════════════════════╝

-- keymaps that I wan't to ALWAYS load to help with
-- debugging vim setup. Hence, they are loaded before
-- anything else.

require("settings.fault-management")

--  ╔══════════════════════════════════════════════════════════╗
--  ║              Important Directories Shortcut              ║
--  ╚══════════════════════════════════════════════════════════╝

require("settings.directories")

--  ╔══════════════════════════════════════════════════════════╗
--  ║                    Preffered Defaults                    ║
--  ╚══════════════════════════════════════════════════════════╝

require("settings.defaults")

--  ╔══════════════════════════════════════════════════════════╗
--  ║                     PLUGING MANAGER                      ║
--  ╚══════════════════════════════════════════════════════════╝
-- see ./lua/plugins/ for to setup the plugins
--{{

require('settings.lazy')


--}}

--  ╔══════════════════════════════════════════════════════════╗
--  ║                   GLOBAL KEY MAPPINGS                    ║
--  ╚══════════════════════════════════════════════════════════╝

require("settings.keymaps")
require("settings.commands")

--  ┌                                                          ┐
--  │                      Global Toggles                      │
--  └                                                          ┘
require("settings.toggle")

--  ╒══════════════════════════════════════════════════════════╕
--  │                        autocmd's                         │
--  ╘══════════════════════════════════════════════════════════╛

require("settings.autocmd")

-- vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
