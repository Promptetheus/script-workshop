#!/bin/bash


# Function to calculate exposure time
calculate_exposure_time() {
  # Validate input parameters
  if [ $# -ne 3 ]; then
    echo "Usage: $0 aperture iso light_intensity"
    return 1
  fi

  aperture=$1
  iso=$2
  light_intensity=$3

  # Validate aperture value
  if [ $aperture -le 0 ]; then
    echo "Aperture value must be greater than 0"
    return 1
  fi

  # Validate ISO setting
  if [ $iso -le 0 ]; then
    echo "ISO setting must be greater than 0"
    return 1
  fi

  # Validate light intensity
  if [ $light_intensity -le 0 ]; then
    echo "Light intensity must be greater than 0"
    return 1
  fi

  # Calculate exposure time using the formula: exposure_time = 1 / (aperture * iso * light_intensity)
  exposure_time=$(bc -l <<< "1 / ($aperture * $iso * $light_intensity)")

  echo "$exposure_time"
}

# Main program
if [ $# -eq 3 ]; then
  calculate_exposure_time $1 $2 $3
else
  echo "Usage: $0 aperture iso light_intensity"
fi