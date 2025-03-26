
echo -n "Enter file name: "
read file

if [ "$1" != "verify" ]; then
    # Generate and save hash
    if [ -f "$file" ]; then
        sha256sum "$file" > "$file.hash"
        echo "Hash saved as $file.hash. To verify, run the script with 'verify' option."
    else
        echo "File does not exist."
        exit 1
    fi
fi

# Step 2: Verify hash
if [ "$1" == "verify" ]; then
    if [ -f "$file.hash" ]; then
        if sha256sum -c "$file.hash" 2>/dev/null; then
            echo "File integrity is intact."
        else
            echo "File has been modified!"
        fi
    else
        echo "Hash file not found!"
    fi
fi
