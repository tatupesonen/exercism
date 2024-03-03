use time::PrimitiveDateTime as DateTime;

const KILO: u32 = 1000;
const MEGA: u32 = 1_000_000;
const GIGA: u64 = (KILO * MEGA) as u64;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
  start + std::time::Duration::from_secs(GIGA)
}

