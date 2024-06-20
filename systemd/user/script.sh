#!/bin/bash

while true
do
    used_mem=$(free | awk 'NR==2 {print $3}')
    total_mem=$(free | awk 'NR==2 {print $2}')
    
    used_percentage=$((used_mem * 100 / total_mem))

    if [ $used_percentage -gt 90 ]
    then
        # Invoke your callback function here
        echo "Memory usage is high. Callback function invoked."
        kill $(ps aux | grep '[l]ua-language-se' | awk '{print $2}')
    fi

    sleep 60  # Check memory usage every 60 seconds
done

