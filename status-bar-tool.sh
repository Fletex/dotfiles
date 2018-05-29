#!/usr/bin/zsh
#
# zpool - error line of nas zpool
# flow  - wchan flow-capture on flow
# wan   - ping ziragon.com
# cam2  - ping cam2.ziragon.com
COLOR_OK="#c5c8c6"
COLOR_WARN="#de935f"
COLOR_BAD="#a54242"

case "$BLOCK_NAME" in
    status-br)
        STATUS=$(xrandr --verbose | awk '/Brightness/{print $2}')
        echo $STATUS
        echo $STATUS
        if [[ $STATUS = "1.0" ]] then
            echo $COLOR_OK
        else
            echo $COLOR_WARN
        fi
        ;;
    status-layout)
        STATUS=$(setxkbmap -query | awk '/layout/ { print $2 }')
        echo $STATUS
        echo $STATUS
        if [[ $STATUS = "us" ]] then
            echo $COLOR_OK 
        else
            echo $COLOR_WARN
        fi
        ;;
    status-zpool)
        STATUS=$(ssh nas 'sudo zpool status' |  awk -F: '/^errors/ { print substr($2,2) }')
        echo $STATUS
        if [[ $STATUS = "No known data errors" ]] then
            echo "None"
            echo $COLOR_OK 
        else
            echo "errors"
            echo $COLOR_BAD
        fi
        ;;
    status-flow)
        STATUS=$(ssh flow 'ps -p $(</var/db/flows/flow-capture-alix.pid.5678) -o wchan' | awk 'NR==2 {print $1}')
        echo $STATUS
        if [[ $STATUS = "select" ]] then
            echo "OK"
            echo $COLOR_OK 
        else
            echo "FAIL"
            echo $COLOR_BAD
        fi
        ;;
    *)
        echo "script case fail"
        echo "script fail"
        echo $COLOR_BAD
        ;;
esac

