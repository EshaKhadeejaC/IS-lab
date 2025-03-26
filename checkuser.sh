
echo -n "Enter the username to monitor: "
read username

attempts=0

while [ $attempts -lt 2 ]; do
    if who | grep -w "$username" > /dev/null; then
        echo "User $username has logged in!"
        exit 0
    else
        echo "Checking again in 30 seconds..."
        sleep 30
        ((attempts++))
    fi
done

echo "User $username is not logged in."
exit 1
