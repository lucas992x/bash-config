#!/bin/bash

# if file exists and is not empty, append its content to output file
process_file() {
    input_file="$1"
    dest_file="$2"
    if [[ -f "$input_file" ]]; then
        input_content=$(cat "$input_file")
        if [[ ! -z $input_content ]]; then
            echo "$input_content" >>"$dest_file"
            echo "" >>"$dest_file"
            echo "+ Appended content of $input_file to $dest_file"
        else
            echo "- File $input_file is empty, skipping it"
        fi
    else
        echo "- File $input_file not found, skipping it"
    fi
}

# process all files in given category
process_files() {
    script_dir="$(dirname "$(realpath $0)")"
    category="$1"
    specification="$2"
    destination="$3"
    if [[ -z $specification ]]; then
        process_file "$script_dir/$category.txt" "$destination"
    else
        # split string and process single specifications
        readarray -d "-" -t specs < <(printf '%s' "$specification")
        for ((s = 0; s < ${#specs[*]}; s++)); do
            spec="${specs[s]}"
            if [[ -z "$spec" ]]; then
                file_path="$script_dir/$category.txt"
            else
                file_path="$script_dir/$category-$spec.txt"
            fi
            #echo "Processing file $file_path"
            process_file "$file_path" "$destination"
        done
    fi
}

# set default output file
output_file=~/.bash_aliases
# read args
while getopts ":c:s:rpo:a" arg; do
    case $arg in
    c)
        categories="$OPTARG"
        ;;
    s)
        specifics="$OPTARG"
        ;;
    r)
        output_file=~/.bashrc
        ;;
    p)
        output_file=~/.bash_profile
        ;;
    o)
        output_file="$OPTARG"
        ;;
    a)
        append=true
        ;;
    *)
        exit 1
        ;;
    esac
done
# empty output file, unless -a was passed
if [[ ! $append ]]; then
    >"$output_file"
fi
# process all files
readarray -d "-" -t cats < <(printf '%s' "$categories")
for ((c = 0; c < ${#cats[*]}; c++)); do
    #echo "Processing ${cats[c]} $specifics"
    process_files "${cats[c]}" "$specifics" "$output_file"
done
