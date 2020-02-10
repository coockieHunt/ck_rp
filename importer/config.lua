config_pacakge = switch {
    ["config_file"] = "config.lua",
    ["server_folder"] = "server",
    ["display_console"] = true,
    ["log_file"] = "log_pacakge.txt",
}

import_package = switch {
  ["package"] = {
    "log",
    "data",
    "init",
    "account",
    "hub",
    "admin",
    "cmd"
  }
}