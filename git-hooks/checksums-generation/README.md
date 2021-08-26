# Git commit hooks for checksum generation

## How do they work?
### Pre-commit
Before commit, the `pre-commit` hook is ran.

It creates a file `.commit`.

### Post-commit
After commit the `post-commit` hook is ran.

It checks if `.commit` file exists. If it does, it genereates a `checksums.txt` file and adds it to the existing commit.
