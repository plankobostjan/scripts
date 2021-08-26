prepare(){
    FILE=$1
    declare -a OK_DOMAINS
    declare -a NX_DOMAINS
}

process_domains(){
    while IFS= read -r DOMAIN
    do
        if [ "$(dig -x +short $DOMAIN)" == "" ]
        then
            NX_DOMAINS+=($DOMAIN)
        else
            OK_DOMAINS+=("$(dig +short $DOMAIN) # $DOMAIN")
        fi
    done < "$FILE"
}

print_resolved_domains(){
    echo "---------------------------------------------------"
    echo "These domains were successfuly resolved:"
    for DOMAIN in "${OK_DOMAINS[@]}"
    do
        echo "$DOMAIN"
    done
    echo "---------------------------------------------------"
}

print_nonresolved_domains(){
    echo "---------------------------------------------------"
    echo "These domains were not resolved:"
    for DOMAIN in "${NX_DOMAINS[@]}"
    do
        echo "$DOMAIN"
    done
    echo "---------------------------------------------------"
}

prepare $1
process_domains
print_resolved_domains
print_nonresolved_domains
