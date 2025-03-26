echo -n "Enter the file to remove execute permissions: "
read filename

if [ -f "$filename" ]; then
    chmod -x "$filename"
    echo "Execution permission removed from $filename"
else
    echo "File does not exist."
fi
