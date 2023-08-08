directory="/home/bimsara/Desktop/shell"
results_dir="$directory/results"
archive_dir="$results_dir/archive"
total_word_count_file="$results_dir/TotalWordCount.txt"

# Create the results directory if it doesn't exist
mkdir -p "$results_dir"

# Create the archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Clear the contents of the total word count file
> "$total_word_count_file"

# Loop through each file in the directory
for file in "$directory"/*.txt; do
    # Create a temporary file to store the modified content
    temp_file=$(mktemp)

    # Read each line of the file
    while IFS= read -r line; do
        # Check if the line contains the word "IMPORTANT"
        if [[ $line == *"IMPORTANT"* ]]; then
            continue  # Skip this line
        fi
        echo "$line" >> "$temp_file"  # Append the line to the temporary file
    done < "$file"

    # Replace the original file with the modified content
    mv "$temp_file" "$file"

    # Count the number of words in the file (separated by '|')
    word_count=$(grep -o "|" "$file" | wc -l)
    ((word_count++))  # Increment by 1 to account for the last word

    # Append the file name and word count to the total word count file
    echo "$(basename "$file") - $word_count words" >> "$total_word_count_file"
done

# Move the total word count file to the archive directory
mv "$total_word_count_file" "$archive_dir"

