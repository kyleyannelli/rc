#!/bin/bash
M1DDC="/usr/local/bin/m1ddc"

function display_list() {
    $M1DDC display list
}

function combined_brightness() {
    local combined=$1

    $M1DDC display $ALIENWARE_DISP_NUM set luminance $combined
    $M1DDC display $ALIENWARE_DISP_NUM set contrast $combined
}

function main() {
    local ALIENWARE_DISP_NUM=$(display_list | grep "$DISPLAY" | awk '{ print $1 }' | grep -Eo '[0-9]*')

    if [[ $ALIENWARE_DISP_NUM == "" ]]; then
        echo "Did not find $DISPLAY in display list."
        echo "Here is what is available."
        echo
        display_list | awk '{ print $2 }'
        exit 1
    fi

    if [[ $BRIGHTNESS == "bright" ]]; then
        combined_brightness 75
    elif [[ $BRIGHTNESS == "dark" ]]; then
        combined_brightness 50
    else
        echo "Unable to determine what is desired by $BRIGHTNESS. Recognized options are \"bright\" and \"dark\""
        exit 1
    fi
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--display)
            DISPLAY="$2"
            shift 2
            ;;
        -b|--brightness)
            BRIGHTNESS="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  -d, --display DISPLAY      The display identifier shown by m1ddc."
            echo "  -b, --brightness LEVEL     bright or dark"
            echo "  -h, --help                 Show this help message"
            exit 0
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            exit 1
            ;;
        *)
            echo "Error: Unexpected argument $1" >&2
            exit 1
            ;;
    esac
done

main
