pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(x) { x + secret }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(x) { x - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(x) { x * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn(x) { x / secret }
}

pub fn secret_combine(x: fn(Int) -> Int, y: fn(Int) -> Int) -> fn(Int) -> Int {
  fn(a) { y(x(a)) }
}
