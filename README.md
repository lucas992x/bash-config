This repository contains a script that fills `~/.bash_aliases` (or whatever file is used to store custom aliases, exports and so on) using text files.

# Setup #
Here is an explanation of how I use this repository, but script has arguments that make it flexible and adaptable to different usages.

In `data` folder I created file `exports.txt` with various exports: its content will be added as-is to `~/.bash_aliases`, so it uses Bash syntax. Some exports differ based on distro, so I created `exports-arch.txt` and `exports-debian.txt`; others differ between personal PC and work PC, so I created `exports-personal.txt` and `exports-work.txt`.

Similarly I created `aliases.txt`, which contains frequent aliases, with `aliases-arch.txt` and `aliases-debian.txt` for distribution-specific aliases. Then I created `path.txt` for PATH and `other.txt` for remaining stuff.

Do note that if any file used during the execution is empty or does not exist it will be skipped, without raising any errors.

# Usage #
- `-c` specifies which files the script has to search for and in what order, in my case it is `exports-aliases-path-other`.
- `-s` allows to use specific files in addition to common ones, separated by hyphen if multiple, with empty one that refers to common file. Here are some examples to clarify (only exports are explained but same holds for any other category):
    - If empty or unspecified only `exports.txt` is used.
    - `arch-` uses `exports-arch.txt` and `exports.txt` in this order.
    - `arch--personal` uses `exports-arch.txt`, `exports.txt`, `exports-personal.txt` in this order.
    - `-arch-personal` uses `exports.txt`, `exports-arch.txt`, `exports-personal.txt` in this order.
    - `arch-personal` uses `exports-arch.txt` and `exports-personal.txt` in this order.
- `-r` is a flag used to write data in `~/.bashrc` instead of `~/.bash_aliases`.
- `-p` is a flag used to write data in `~/.bash_profile` instead of `~/.bash_aliases`.
- `-o` allows to use a custom output file.
- `-a` is a flag used to append content to output file instead of overwriting it.

# Examples #
If you copy `samples` directory content in repository directory, here are sample commands and their outputs, resulting files are included in `samples` directory as well.

Sample commands:
```
bash bash-config.sh -c exports-aliases-path -o output-arch.bash_aliases -s "-arch"
bash bash-config.sh -c exports-aliases-path -o output-debian.bash_aliases -s "-debian"
bash bash-config.sh -c exports-aliases-path -o output-common.bash_aliases
```
Respective outputs (`[...]` will be replaced by the directory where you cloned this repository):
```
+ Appended content of [...]/bash-config/exports.txt to output-arch.bash_aliases
+ Appended content of [...]/bash-config/exports-arch.txt to output-arch.bash_aliases
+ Appended content of [...]/bash-config/aliases.txt to output-arch.bash_aliases
- File [...]/bash-config/aliases-arch.txt not found, skipping it
+ Appended content of [...]/bash-config/path.txt to output-arch.bash_aliases
- File [...]/bash-config/path-arch.txt not found, skipping it

+ Appended content of [...]/bash-config/exports.txt to output-debian.bash_aliases
+ Appended content of [...]/bash-config/exports-debian.txt to output-debian.bash_aliases
+ Appended content of [...]/bash-config/aliases.txt to output-debian.bash_aliases
+ Appended content of [...]/bash-config/aliases-debian.txt to output-debian.bash_aliases
+ Appended content of [...]/bash-config/path.txt to output-debian.bash_aliases
- File [...]/bash-config/path-debian.txt not found, skipping it

+ Appended content of [...]/bash-config/exports.txt to output-common.bash_aliases
+ Appended content of [...]/bash-config/aliases.txt to output-common.bash_aliases
+ Appended content of [...]/bash-config/path.txt to output-common.bash_aliases
```
