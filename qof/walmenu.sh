#!/usr/bin/env bash
#you can go check out Breads script if it is more of your type of flow

menu() {
		while true; do
    if ! command -v nsxiv >/dev/null; then
        echo "nsxiv not installed"
        exit 1
    fi

    FOLDER=$(ls ~/Desktop/conesque/refs/ | rofi -dmenu -p "choose your folder" )
    if [[ -z "$FOLDER" ]]; then
        echo "folder/image wasnt selected or something went wrong, quitting..."
        exit 0
    fi

	CHOICE=$(nsxiv -otb ~/Desktop/conesque/refs/"$FOLDER"/*)

    if [[ -n "$CHOICE" ]]; then
		echo "image was selected!"	
		break
	else
			echo "exit!exit!exit! important things are repeated 3 times!"
    fi
done
}

case "$#" in
    0)
        menu
;;
    *)
        exit 0
        ;;

esac
