import gleam/list

pub type Name =
  String

pub type X =
  String

pub type Y =
  Int

pub type Place =
  #(Name, PlaceLocation)

pub type PlaceLocation =
  #(X, Y)

pub type TreasureLocation =
  #(Y, X)

pub type Treasure =
  #(Name, TreasureLocation)

pub fn place_location_to_treasure_location(
  place_location: PlaceLocation,
) -> TreasureLocation {
  case place_location {
    #(x, y) -> #(y, x)
  }
}

pub fn treasure_location_matches_place_location(
  place_location: PlaceLocation,
  treasure_location: TreasureLocation,
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(place: Place, treasures: List(Treasure)) -> Int {
  treasures
  |> list.filter(fn(t) {
    treasure_location_matches_place_location(place.1, t.1)
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: Treasure,
  place: Place,
  desired_treasure: Treasure,
) -> Bool {
  case place, found_treasure, desired_treasure {
    #("Abandoned Lighthouse", _), _, _ -> True
    #("Stormy Breakwater", _), #("Amethyst Octopus", _), #("Crystal Crab", _)
    | #("Stormy Breakwater", _), #("Amethyst Octopus", _), #(
      "Glass Starfish",
      _,
    ) -> True
    #("Harbor Managers Office", _), #("Vintage Pirate Hat", _), #(
      "Model Ship in Large Bottle",
      _,
    )
    | #("Harbor Managers Office", _), #("Vintage Pirate Hat", _), #(
      "Antique Glass Fishnet Float",
      _,
    ) -> True
    _, _, _ -> False
  }
}
