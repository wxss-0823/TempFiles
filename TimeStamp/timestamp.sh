# Sun Dec 08 xx:xx:xx 2024
timestamp=$(date "+%a %b %d %H:%M:%S %Y")

echo $timestamp >> ./TimeStamp/timestamp.txt

tail -n 1 ./TimeStamp/timestamp.txt