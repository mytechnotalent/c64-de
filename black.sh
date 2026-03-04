#!/bin/bash

# Format Python files with black
echo "Running black on Python files..."
find . -name "*.py" -not -path "*/__pycache__/*" | xargs python3 -m black --quiet