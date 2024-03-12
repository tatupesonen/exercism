import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  tlco_pizza_price(pizza, 0)
}

pub fn tlco_pizza_price(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    ExtraSauce(pizza) -> tlco_pizza_price(pizza, 1 + acc)
    ExtraToppings(pizza) -> tlco_pizza_price(pizza, 2 + acc)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  tlco_order_price(order, 0)
  + case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
}

pub fn tlco_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..rest] -> tlco_order_price(rest, acc + pizza_price(pizza))
  }
}
