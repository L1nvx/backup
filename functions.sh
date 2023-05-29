function work(){
    if [[ -n $1 ]]; then
        mkdir -p $1
        cd $1
        echo $PWD >/tmp/current-pwd.txt
    else
        if [[ -f /tmp/current-pwd.txt ]]; then
            cd $(cat /tmp/current-pwd.txt)
        else
            echo "No current dir set"
        fi
    fi
}

function scan(){
    sudo nmap -p- $1 -sS -oN nmap/all-tcp-ports.txt -v --min-rate 5000 -n -Pn
    sudo nmap -p$(cat nmap/all-tcp-ports.txt | grep -oP ".+open"| cut -d / -f 1 | tr "\n" ',' | sed "s/,$//g") $1 -sS -oN nmap/all-tcp-version.txt -v -A -n -Pn
}

function target(){
    if [[ -n $1 ]]; then
        echo $1 >/tmp/target.txt
    else
        echo "$0 <ip>"
    fi
}