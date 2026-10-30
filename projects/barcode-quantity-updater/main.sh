#!/bin/bash


# Validate user input
if [ $# -ne 3 ]; then
  echo "Usage: $0 barcode_id new_quantity description"
  exit 1
fi

BARCODE_ID=$1
NEW_QUANTITY=$2
DESCRIPTION=$3

# Read the inventory file
INVENTORY_FILE="inventory.txt"

# Check if the inventory file exists
if [ ! -f "$INVENTORY_FILE" ]; then
  echo "Inventory file not found. Creating a new one."
  echo "$BARCODE_ID $NEW_QUANTITY $DESCRIPTION" > "$INVENTORY_FILE"
  echo "$NEW_QUANTITY $DESCRIPTION"
  exit 0
fi

# Parse the inventory file
QUANTITY=$(awk -v barcode="$BARCODE_ID" '$1 == barcode {print $2}' "$INVENTORY_FILE")
DESCRIPTION=$(awk -v barcode="$BARCODE_ID" '$1 == barcode {print $3}' "$INVENTORY_FILE")

# Update the quantity
if [ -n "$QUANTITY" ]; then
  echo "Updating quantity of $BARCODE_ID"
  sed -i "/^$BARCODE_ID / s/$QUANTITY/$NEW_QUANTITY/" "$INVENTORY_FILE"
  echo "$NEW_QUANTITY"
else
  echo "Barcode ID not found in inventory."
  exit 1
fi

# Print the updated quantity and description
echo "$DESCRIPTION"