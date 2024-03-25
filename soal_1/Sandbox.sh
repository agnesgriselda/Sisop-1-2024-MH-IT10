mkdir sandbox
ls
cd sandbox
wget -O Sandbox.csv 'https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0'
ls
cat Sandbox.csv
awk -F ',' '{print $6, $17}' Sandbox.csv | sort | head -n 1 | awk '{print "Pembeli dengan total sales tertinggi :", $1, $2}'
awk -F ',' '{print $7, $20}' Sandbox.csv | sort | head -n 1 | awk '{print "Customer segment dengan profit terkecil :", $1, $2}'
awk -F ',' '{print $14, $20}' Sandbox.csv | sort -nr | head -n 3 | awk '{print "3 kategori yang memiliki profit terkecil :", $1, $2}'
grep "Adriaens" Sandbox.csv | awk -F ',' '{print $2, $18, $6}' | awk '{print "Purchase date :", $1, $2}, | awk '{print "dan Quantity :", $1, $2}' | awk '{print "dari Nama Adriaens :", $1, $2}'
grep "Adriaens" Sandbox.csv | awk -F ',' '{print "Purchase date :", $2,"dan Quantity :", $18, "dari Nama Adriaens :", $6}'
