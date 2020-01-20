config_log_color = switch {
    ["error"] = "F82C00",
    ["warning"] = "E5B100",
    ["info"] = "0438CE",
    ["ok"] = "10CE04",
  }

  config_log_file = switch {
    ["admin"] = "log_admin.txt",
    ["login"] = "log_login.txt",
  }