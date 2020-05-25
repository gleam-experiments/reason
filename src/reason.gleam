pub type Reason {
  Reason(detail: String, stack: List(String))
}

pub fn new(detail: String) -> Reason {
  Reason(detail: detail, stack: [])
}

pub fn error(detail: String) -> Result(a, Reason) {
  Error(new(detail))
}

pub fn put(result: Result(a, e), detail: String) -> Result(a, Reason) {
  case result {
    Ok(a) -> Ok(a)
    Error(_) -> Error(new(detail))
  }
}

pub fn context(reason: Reason, frame: String) -> Reason {
  Reason(detail: reason.detail, stack: [frame, ..reason.stack])
}
