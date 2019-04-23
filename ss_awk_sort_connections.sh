ss -n state time-wait | awk '{print $3}' | awk -F":" '{print $1}' | sort | uniq -c | sort -rn 
ss -n state established | awk '{print $3}' | awk -F":" '{print $1}' | sort | uniq -c | sort -rn 
ss -n state syn-recv | awk '{print $3}' | awk -F":" '{print $1}' | sort | uniq -c | sort -rn 
ss -n state last-ack | awk '{print $3}' | awk -F":" '{print $1}' | sort | uniq -c | sort -rn
