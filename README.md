# Code Extractor for LLM

This repository contains a shell script that recursively searches for code files matching specified patterns within a directory and its subdirectories, and aggregates their contents into a single output file. The purpose of this script is to facilitate the collection of code snippets from existing projects for use with a Large Language Model (LLM).

## Motivation

When working with LLMs, it can be beneficial to provide them with a diverse set of code examples to improve their understanding and generation of code. This script simplifies the process of extracting code snippets from multiple files across different projects and consolidates them into a single file, making it easier to feed the code examples to an LLM.

## Usage

To use the code extractor script, follow these steps:

1. Clone this repository to your local machine.
2. Open a terminal and navigate to the repository directory.
3. Make the script executable by running the following command:
   ```
   chmod +x code_extractor.sh
   ```
4. Run the script with the desired options:
   ```
   ./code_extractor.sh [OPTIONS]
   ```

   Available options:
   - `-d, --directory DIR`: Specify the directory to search for code files (default: current directory).
   - `-e, --extensions EXT`: Specify file extensions or patterns (comma-separated, default: `*.txt,*.py,*.c,*.go`).
   - `-o, --output FILE`: Specify the output file name (default: `output.txt`).
   - `-h, --help`: Display the help message.

5. The script will recursively search for code files matching the specified patterns within the given directory and its subdirectories.
6. The contents of the matched code files will be extracted and written to the specified output file.
7. The output file will contain the file path, name, and contents of each code file, separated by delimiters.

## Example

To extract code snippets from Python files in the `~/projects` directory and save them to `python_code.txt`, run:

```
./code_extractor.sh -d ~/projects -e "*.py" -o python_code.txt
```

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to customize and enhance the script based on your specific requirements.
