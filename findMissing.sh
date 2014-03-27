# Author : Kevin Considine
# Class : CS210s14
# Assignment : Project 1
# Summary : This script will look at all extensions which are of text type and create a list of image files which are referenced.
#           This program will only look at files within the sample directory inside of the current working directory.
#           If a file exists in a directory and is referenced by any files in the current directory, it will be printed out.


# Look for image files within the sample directory inside of the current working directory.
# Find each image file types individually and save it in /tmp/patterns.

echo ' '
echo "Files referenced that DO exist within the directory:"
echo ' '
find ./sample -name *.jpg -exec basename {} \; > /tmp/patterns
find ./sample -name *.png -exec basename {} \; >> /tmp/patterns
find ./sample -name *.gif -exec basename {} \; >> /tmp/patterns

# Print a list of lines that DO exist and are referenced.
# awk ansures that the third line of the output (the filename/path) is printed.
# awk is used again it's to print only lines with less than 25 characters (lines with the filenames as their thrid word).
# sed is implemented to remove the " and , symbols from the output.
# The cat command removes coloring. Deja vu.

grep -Rf /tmp/patterns ./sample | awk '{print $3}' | awk 'length < 25 {print}' | sed 's/"//g' | sed 's/,//g' | cat
echo ' '
