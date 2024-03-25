mkdir sandbox
ls
cd sandbox
wget -O Sandbox.csv 'https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0'
ls
cat Sandbox.csv
awk -F ',' '{print $6, $17}' Sandbox.csv | sort -k1 | head -n 1 | awk '{print $1, $2}'
awk -F ',' '{print $7, $20}' Sandbox.csv | sort -k1 | head -n 1 | awk '{print $1, $2}'
awk -F ',' '{print $14, $20}' Sandbox.csv | sort -nr | head -n 3 | awk '{print $1, $2}'
grep "Adriaens" Sandbox.csv | awk -F ',' '{print "Purchase date :", $2,"dan Quantity :", $18, "dari Nama Adriaens :", $6}'
