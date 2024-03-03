// Package weather provides utilities for getting a weather forecast.
package weather

// CurrentCondition is the current weather condition.
var CurrentCondition string
// CurrentLocation is the location of the weather condition.
var CurrentLocation string

// Forecast gets a textual representation of the weather condition for a location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
