import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [head, ..] -> head
    [] -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [head, ..rest] -> [head + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(x) { x == 0 })
}

pub fn total(days: List(Int)) -> Int {
  list.fold(days, 0, fn(acc, cur) { acc + cur })
}

pub fn busy_days(days: List(Int)) -> Int {
  list.filter(days, fn(count) { count >= 5 })
  |> list.length()
}
