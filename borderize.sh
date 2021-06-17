#! /usr/bin/env zsh

# Help here: https://superuser.com/questions/241212/how-do-you-use-sips-at-the-terminal-to-resize-an-image-without-upscaling

wide_border=1.3
narrow_border=1.07
border_color=FFFFFF
mkdir -p ./borderized # Create the output folder, if it doesn't already exist


for file in *.jpg
do
	if [ "$1" = "dark" ]
		then
			border_color=121212
		elif [ "$1" = "pale" ]
			then
			border_color=F8EDEB
		elif [ "$1" = "mint" ]
			then
			border_color=D8E2DC
		elif [ "$1" = "mute" ]
			then
			border_color=E8E8E4
		elif [ "$1" = "peach" ]
			then
			border_color=FFD7BA
		elif [ "$1" = "orange" ]
			then
			border_color=FEC89A
		elif [ "$1" = "forest" ]
			then
			border_color=6B705C
		elif [ "$1" = "greyn" ]
			then
			border_color=B7B7A4
		elif [ "$1" = "dom" ]
			then
				extracted_color=$(dominantcolor.sh -n 2 $file)
			border_color=${extracted_color:1}
		elif [ "$1" = "match" ]
			then
			border_color=$(convert $file -colorspace rgb -scale 1x1 -depth 8 rgb: | xxd -p -c3) # from https://stackoverflow.com/questions/48300657/get-only-hex-values-from-imagemagick
	fi
	echo "converting $file..."
	HEIGHT=$(sips -g pixelHeight $file | grep -o '[0-9]*$') # grep the number, otherwise it's a string with numbers
	WIDTH=$(sips -g pixelWidth $file | grep -o '[0-9]*$')
	if [[ $WIDTH -gt $HEIGHT ]]; then
		FINAL_HEIGHT=$(( $HEIGHT * $wide_border ))
		FINAL_WIDTH=$(( $WIDTH * $narrow_border ))
		GREATEST=$WIDTH
		# echo 'Width is greater than Height'
	elif [[ $WIDTH -lt $HEIGHT ]]; then
		FINAL_HEIGHT=$(( $HEIGHT * $narrow_border ))
		FINAL_WIDTH=$(( $WIDTH * $wide_border ))
		GREATEST=$HEIGHT
		# echo 'Height is greater than Width'
	else
		FINAL_HEIGHT=$(( $HEIGHT * $narrow_border ))
		FINAL_WIDTH=$(( $WIDTH * $narrow_border ))
		GREATEST=$HEIGHT
		# echo 'Image is a square'
	fi

	if [ -n "$1" ]; then
			sips -Z $GREATEST -p $FINAL_HEIGHT $FINAL_WIDTH --padColor $border_color -i $file --out ./borderized/${file%.*}_borderized_${1}.jpg
		else
			sips -Z $GREATEST -p $FINAL_HEIGHT $FINAL_WIDTH --padColor $border_color -i $file --out ./borderized/${file%.*}_borderized.jpg

	fi

	
	echo "$file borderized."
done
