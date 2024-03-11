import gleam/string
pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> line
    | "[WARNING]: " <> line
    | "[INFO]: " <> line -> string.trim(line)
    _ -> log_line
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]" <> _ -> "error"
    "[WARNING]" <> _ -> "warning"
    "[INFO]" <> _ -> "info"
    _ -> "unknown"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
