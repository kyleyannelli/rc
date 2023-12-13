#!/bin/zsh
cd_random() {
    RANDOM_NUMBER=$RANDOM
    DIR="/tmp/${RANDOM_NUMBER}_random"
    mkdir -p "$DIR" && cd "$DIR"
}

cd_random_clean() {
    DIR_LIST=("${(@f)$(ls /tmp | grep -i "_random")}")

    for DIR in $DIR_LIST; do
        echo $DIR
    done

    echo -n "Are you sure you want to delete the above ${#DIR_LIST[@]} folders? (y/n): "
    read -r CONFIRM
    if [[ $CONFIRM == "Y" ]] || [[ $CONFIRM == "y" ]]; then
        DELETE_DELAY_SECONDS=2
        echo "Deleting in ${DELETE_DELAY_SECONDS} seconds..."
        sleep $DELETE_DELAY_SECONDS
        for DIR in $DIR_LIST; do
            rm -rf "/tmp/${DIR}"
            echo "Deleted ${DIR}"
        done
        echo "Done!"
    else
        echo "Cancelled!"
    fi
}

