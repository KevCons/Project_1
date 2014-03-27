# Author : Kevin Considine
# Class : CS210s14
# Assignment : Project 1
# Summary : This script will look at all extensions which are of text type and create a list of image files which are referenced.
#           This program will only look at files within the sample directory inside of the current working directory.
#           If a file exists in a directory but it is not referenced by any files in the current directory, it will be printed out.


# Look for image files within the sample directory inside of the current working directory.
# Find each image file types individually and save it in /tmp/patterns.

echo ' '
echo "Files referenced that DO NOT exist within the directory:"
echo ' '
find ./sample -name *.jpg -exec basename {} \; > /tmp/patterns
find ./sample -name *.png -exec basename {} \; >> /tmp/patterns
find ./sample -name *.gif -exec basename {} \; >> /tmp/patterns

# Print a list of files that DO NOT exist.
# The variable 'p' is a representation of /tmp/patterns.
# /dev/null removes any files that exist in a directory but are not referenced by any files in the curret directory.
# The cat command removes coloring.

for p in $(cat /tmp/patterns); do
    grep -R $p ./sample > /dev/null || echo $p;
done
echo ' '
