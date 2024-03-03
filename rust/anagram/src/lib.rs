use std::collections::{HashMap, HashSet};

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
  let w = create_count_map(word);
  let mut anagrams = HashSet::new();
  for anagram in possible_anagrams {
    if word.to_lowercase().to_string() == anagram.to_lowercase().to_string() {
      continue;
    }
    let map = create_count_map(anagram);
    if map == w {
      anagrams.insert(*anagram);
    }
  }
  anagrams
}

fn create_count_map(word: &str) -> HashMap<String, u32> {
  let mut char_counts = HashMap::new();
  for char in word.chars() {
    let lower = char.to_lowercase().to_string();
    char_counts.entry(lower).and_modify(|count| *count += 1)
    .or_insert(1);
  }
  char_counts
}
