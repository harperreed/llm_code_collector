#!/bin/bash

# Set default values
dir_path="."
file_patterns=("*.txt" "*.py" "*.c" "*.go")
output_file="output.txt"

# Display help message
display_help() {
  echo "Usage: $0 [OPTIONS]"
  echo "Recursively search for files matching specified patterns and write their contents to an output file."
  echo
  echo "Options:"
  echo "  -d, --directory DIR    Specify the directory to search (default: current directory)"
  echo "  -e, --extensions EXT   Specify file extensions or patterns (comma-separated, default: *.txt,*.py,*.c,*.go)"
  echo "  -o, --output FILE      Specify the output file name (default: output.txt)"
  echo "  -h, --help             Display this help message"
  echo
  exit 0
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--directory)
      dir_path="$2"
      shift 2
      ;;
    -e|--extensions)
      IFS=',' read -ra file_patterns <<< "$2"
      shift 2
      ;;
    -o|--output)
      output_file="$2"
      shift 2
      ;;
    -h|--help)
      display_help
      ;;
    *)
      echo "Unknown option: $1"
      display_help
      exit 1
      ;;
  esac
done

# Recursive function to process files
process_files() {
  local dir="$1"
  for file in "$dir"/*; do
    if [[ -f "$file" ]]; then
      for pattern in "${file_patterns[@]}"; do
        if [[ "$file" == $dir_path/$pattern ]]; then
          echo "$(dirname "$file")/$(basename "$file")" >> "$output_file"
          echo "==========" >> "$output_file"
          cat "$file" >> "$output_file"
          echo "---" >> "$output_file"
          break
        fi
      done
    elif [[ -d "$file" ]]; then
      process_files "$file"
    fi
  done
}

# Check if the specified directory exists
if [[ ! -d "$dir_path" ]]; then
  echo "Error: Directory '$dir_path' does not exist."
  exit 1
fi

# Clear the output file
> "$output_file"

# Start processing files recursively
process_files "$dir_path"

echo "File contents written to $output_file"
