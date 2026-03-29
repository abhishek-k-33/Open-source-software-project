#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Course: Open Source Software (OSS NGMC)
# Purpose: Collect user ideas and generate a personalized manifesto text file.

echo "Answer three questions to generate your manifesto."
echo

# Interactive prompts.
read -r -p "1. Name one open-source tool you use every day: " TOOL
read -r -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -r -p "3. Name one thing you would build and share freely: " BUILD

DATE="$(date '+%d %B %Y')"
OUTPUT="manifesto_$(whoami)_$(date '+%Y%m%d_%H%M%S').txt"

# Alias concept note:
# Example alias that many Linux users define in ~/.bashrc:
# alias ll='ls -alF'

# Write manifesto header (overwrite file if it exists with same name).
echo "Open Source Manifesto" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo >> "$OUTPUT"

# Compose a short personalized paragraph and append to file.
echo "I rely on $TOOL every day, and it reminds me that software can be both practical and shared." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM: the ability to learn from code, improve it, and pass that value forward." >> "$OUTPUT"
echo "If given the chance, I would build $BUILD and share it openly so others can adapt it to their own needs." >> "$OUTPUT"
echo "This is my commitment to open collaboration and responsible technology." >> "$OUTPUT"

echo
echo "Manifesto saved to $OUTPUT"
echo "---------------- Manifesto Preview ----------------"
cat "$OUTPUT"
echo "---------------------------------------------------"
