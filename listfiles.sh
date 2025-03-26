directory="${1:-.}"

serial=1
for file in "$directory"/*; do
    if [ -f "$file" ]; then

        creation_date=$(stat -c %w "$file")  
        if [ "$creation_date" = "-" ]; then

            creation_date=$(stat -c %y "$file")  
        fi
        echo "Serial Number: $serial, File: $file, Creation Date: $creation_date"
        serial=$(($serial + 1))  
        
    fi
done
