#!/bin/bash

# Extracts all unique words from a text and creates an alphabetical list of all words used, and a separate frequency list of the 100 most used words in the source file.
# Assumes file containing text to be parsed is located in home directory; change path if desired, e.g. */home/username/Desktop/filename.txt*, etc.
# Fill in name of file that contains the source text, e.g. *original.txt*, as below.
# For Unique Word List, fill in file destination of extracted word list, e.g. *word_list_out.txt*; any existing contents will be overwritten. File will be created automatically if not present.
# For a sorted list of only the 100 (etc.) of the most frequently used words in the source file, fill in file destination of extracted word list, e.g. *word_freq_out.txt*; any existing contents will be overwritten. File will be created automatically if not present.
# Either of the two operations below can be disabled with a "#" at the start of each line.

#Unique Word List:
cat original.txt | \
    tr [[:upper:]] [[:lower:]] | \
    grep -oE '[[:alpha:]]{1,}' | \
    sort | uniq -i | \
    sort --dictionary-order | cat > word_list_out.txt \
