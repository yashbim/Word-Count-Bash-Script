# Word-Count-Bash-Script
A simple shell script to extract word counts for files in a single directory. Some conditions apply will be available in the readme file.

a simple shell script to extract word counts for files in a single directory under following conditions.

    Files will be having multiple lines and each line would contain 4 ‘|’ delimited sections
    Filter out the lines which do not contain IMPORTANT in the first section.
    Append word count of each file to a file named TotalWordCount.txt in folder named results in the same folder.
    After appending the word counts of a single file, it should be moved to a folder named archive in the same folder.
    Only the files in the root folder should be processed.
