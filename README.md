Scripts to make life a bit easier ;)
---
These are the scripts I've written for some mundane tasks I do often enough that automation makes sense.

Feel free to use them, if they fit your needs.

Suggestions for improvements are also welcome.

## [Multi dig](https://gitlab.dhh.company/bplanko/scripts/-/blob/master/multi-dig.sh)
This is the script I use if I need to resolve multiple domains at once.

It's quite simple, thugh maybe a bit overengineered.

Required input:
- a text file containing domains, one per line

Usage:

Run: `./multi-dig.sh domains.txt`

## [Checksums generator](https://gitlab.dhh.company/bplanko/scripts/-/blob/master/checksums-generator.sh)
I use this script to generate sha256sums for my scripts (or other files if need be).

---

**NOTE:** In this repo, the script is run automatically everytime you perform `git commit`. It generates checksums for all `.sh` files and files that are executale by the owner. `./.git/` folder is excluded.

If you're curious how these hooks work, see [`./git-hooks/checksums-generation/`.](https://gitlab.dhh.company/bplanko/scripts/-/tree/master/git-hooks/checksums-generation)

Hooks were created with the help of: <https://stackoverflow.com/a/12802592/14906675>

---

By default, it generates checksums for all `.sh` files or files that are executable by owner. `./.git/` folder is excluded by default.

This comes in handy when you're downloading only one file, and you want to make sure that it's exactly the same as the one in the repository.

Usage:

Run: `./checksums-generator.sh`

## [Output redirection](https://gitlab.dhh.company/bplanko/scripts/-/blob/master/output-redirection.sh)
This script is here to be used as an example.

Depending on how you execute it, it prints everyting in the terminal or to a log file.

It was written with a help of [this](https://ops.tips/gists/redirect-all-outputs-of-a-bash-script-to-a-file) article.

Usage:

Run: `./output-redirection.sh` to print everything to `stdout` and `./output-redirection.sh 1` to print everything to `./output.log`

## [File is empty](https://gitlab.dhh.company/bplanko/scripts/-/blob/master/file-is-empty.sh)
Yet another script that is here as an example.

It detects whether or not the file is empty (if it contains only whitespace characters, then it is considered empty).

It was created with the help of: <https://unix.stackexchange.com/questions/386499/how-to-check-if-file-is-empty-or-it-has-only-blank-characters>

Usage:

Run: `./file-is-empty.sh file.txt`

## [Mkexec](https://gitlab.dhh.company/bplanko/scripts/-/blob/master/mkexec.sh)
This is a script I use (sometimes), to create headers for scripts and programs.

Script asks you a few questions, then it creates a new file with an appropriate header.

Usage:
Run: `./mkexec.sh`
