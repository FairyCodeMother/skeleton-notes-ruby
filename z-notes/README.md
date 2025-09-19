# Ruby Practice Projects

This directory contains small Ruby projects and coding exercises to refamiliarize myself with Ruby.
Projects here are self-contained, focus on core Ruby, and are independent from the main Laravel/PHP backend.

## Project List

[X] **String Manipulation Library**: Reverse strings, check for palindromes, count vowels/consonants, etc.

[ ] **Simple Calculator**: Perform basic arithmetic operations from the command line.

[ ] **Todo List CLI App**: Add, complete, and list tasks from the terminal.

[ ] **File Analyzer**: Count words, lines, and characters in a text file.

[ ] **FizzBuzz Variations**: Classic and customizable FizzBuzz exercises.

[X] **Battleship Board** : Create and populate a battleship board.

## How to Run

1. Make sure you have Ruby installed (`ruby -v`).
3. Run scripts via `ruby filename.rb` or follow each project’s README.

## About This Directory

- This Ruby folder is at the root of my monorepo, alongside `backend/` (Laravel/PHP) and `frontend/` (React/JS/TS).
- It is intentionally separated from the main backend to avoid mixing PHP and Ruby codebases. This will also support future attempts to peel off services.

---


### Setup

```bash
rbenv init

# List available stable Ruby versions
rbenv install -l

# Install latest version
rbenv install 3.4.5

# Set the project version
cd ruby
rbenv local 3.4.5
ruby -v
rbenv init
source ~/.zshrc
rbenv versions
ruby -v
```


```bash
# Wrong ruby? Do it again...
rbenv init
source ~/.zshrc
rbenv versions
rbenv local 3.4.5
ruby -v

```

---
*Maintained by FairyCodeMother*