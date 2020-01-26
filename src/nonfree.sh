mv /etc/apt/sources.list /etc/apt/sources.list.old
while read line; do
    if echo $line | grep -v "^#" | grep -v "contrib" > /dev/null; then
        line=$(echo $line | sed "s/main/main contrib non-free/g")
    fi
    echo $line >> /etc/apt/sources.list
done < /etc/apt/sources.list.old