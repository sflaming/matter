#! /usr/bin/env zsh

# Help here: https://superuser.com/questions/241212/how-do-you-use-sips-at-the-terminal-to-resize-an-image-without-upscaling

WIDE_FRAME=1.3
NARROW_FRAME=1.07
FRAME_COLOUR=FFFFFF
mkdir -p ./framed # Create the output folder, if it doesn't already exist

# define the colours
declare -A colour
colour[aliceblue]="f0f8ff"
colour[antiquewhite]="faebd7"
colour[aqua]="00ffff"
colour[aquamarine]="7fffd4"
colour[azure]="f0ffff"
colour[beige]="f5f5dc"
colour[bisque]="ffe4c4"
colour[black]="000000"
colour[blanchedalmond]="ffebcd"
colour[blue]="0000ff"
colour[blueviolet]="8a2be2"
colour[brown]="a52a2a"
colour[burlywood]="deb887"
colour[cadetblue]="5f9ea0"
colour[chartreuse]="7fff00"
colour[chocolate]="d2691e"
colour[coral]="ff7f50"
colour[cornflowerblue]="6495ed"
colour[cornsilk]="fff8dc"
colour[crimson]="dc143c"
colour[cyan]="00ffff"
colour[darkblue]="00008b"
colour[darkcyan]="008b8b"
colour[darkgoldenrod]="b8860b"
colour[darkgray]="a9a9a9"
colour[darkgreen]="006400"
colour[darkgrey]="a9a9a9"
colour[darkkhaki]="bdb76b"
colour[darkmagenta]="8b008b"
colour[darkolivegreen]="556b2f"
colour[darkorange]="ff8c00"
colour[darkorchid]="9932cc"
colour[darkred]="8b0000"
colour[darksalmon]="e9967a"
colour[darkseagreen]="8fbc8f"
colour[darkslateblue]="483d8b"
colour[darkslategray]="2f4f4f"
colour[darkslategrey]="2f4f4f"
colour[darkturquoise]="00ced1"
colour[darkviolet]="9400d3"
colour[deeppink]="ff1493"
colour[deepskyblue]="00bfff"
colour[dimgray]="696969"
colour[dimgrey]="696969"
colour[dodgerblue]="1e90ff"
colour[firebrick]="b22222"
colour[floralwhite]="fffaf0"
colour[forestgreen]="228b22"
colour[fuchsia]="ff00ff"
colour[gainsboro]="dcdcdc"
colour[ghostwhite]="f8f8ff"
colour[gold]="ffd700"
colour[goldenrod]="daa520"
colour[gray]="808080"
colour[green]="008000"
colour[greenyellow]="adff2f"
colour[grey]="808080"
colour[honeydew]="f0fff0"
colour[hotpink]="ff69b4"
colour[indianred]="cd5c5c"
colour[indigo]="4b0082"
colour[ivory]="fffff0"
colour[khaki]="f0e68c"
colour[lavender]="e6e6fa"
colour[lavenderblush]="fff0f5"
colour[lawngreen]="7cfc00"
colour[lemonchiffon]="fffacd"
colour[lightblue]="add8e6"
colour[lightcoral]="f08080"
colour[lightcyan]="e0ffff"
colour[lightgoldenrodyellow]="fafad2"
colour[lightgray]="d3d3d3"
colour[lightgreen]="90ee90"
colour[lightgrey]="d3d3d3"
colour[lightpink]="ffb6c1"
colour[lightsalmon]="ffa07a"
colour[lightseagreen]="20b2aa"
colour[lightskyblue]="87cefa"
colour[lightslategray]="778899"
colour[lightslategrey]="778899"
colour[lightsteelblue]="b0c4de"
colour[lightyellow]="ffffe0"
colour[lime]="00ff00"
colour[limegreen]="32cd32"
colour[linen]="faf0e6"
colour[magenta]="ff00ff"
colour[maroon]="800000"
colour[mediumaquamarine]="66cdaa"
colour[mediumblue]="0000cd"
colour[mediumorchid]="ba55d3"
colour[mediumpurple]="9370db"
colour[mediumseagreen]="3cb371"
colour[mediumslateblue]="7b68ee"
colour[mediumspringgreen]="00fa9a"
colour[mediumturquoise]="48d1cc"
colour[mediumvioletred]="c71585"
colour[midnightblue]="191970"
colour[mintcream]="f5fffa"
colour[mistyrose]="ffe4e1"
colour[moccasin]="ffe4b5"
colour[navajowhite]="ffdead"
colour[navy]="000080"
colour[oldlace]="fdf5e6"
colour[olive]="808000"
colour[olivedrab]="6b8e23"
colour[orange]="ffa500"
colour[orangered]="ff4500"
colour[orchid]="da70d6"
colour[palegoldenrod]="eee8aa"
colour[palegreen]="98fb98"
colour[paleturquoise]="afeeee"
colour[palevioletred]="db7093"
colour[papayawhip]="ffefd5"
colour[peachpuff]="ffdab9"
colour[peru]="cd853f"
colour[pink]="ffc0cb"
colour[plum]="dda0dd"
colour[powderblue]="b0e0e6"
colour[purple]="800080"
colour[rebeccapurple]="663399"
colour[red]="ff0000"
colour[rosybrown]="bc8f8f"
colour[royalblue]="4169e1"
colour[saddlebrown]="8b4513"
colour[salmon]="fa8072"
colour[sandybrown]="f4a460"
colour[seagreen]="2e8b57"
colour[seashell]="fff5ee"
colour[sienna]="a0522d"
colour[silver]="c0c0c0"
colour[skyblue]="87ceeb"
colour[slateblue]="6a5acd"
colour[slategray]="708090"
colour[slategrey]="708090"
colour[snow]="fffafa"
colour[springgreen]="00ff7f"
colour[steelblue]="4682b4"
colour[tan]="d2b48c"
colour[teal]="008080"
colour[thistle]="d8bfd8"
colour[tomato]="ff6347"
colour[turquoise]="40e0d0"
colour[violet]="ee82ee"
colour[wheat]="f5deb3"
colour[white]="ffffff"
colour[whitesmoke]="f5f5f5"
colour[yellow]="ffff00"
colour[yellowgreen]="9acd32"

for file in *.[jJ][pP][gG] # .jpg extension, case insensitive TODO: make work for other file types.
do
	if ! [ "$1" ]
		then
			FRAME_COLOUR=FFFFFF
		elif [ "$1" = "dark" ]
			then
			FRAME_COLOUR=121212
		elif [ "$1" = "pale" ]
			then
			FRAME_COLOUR=F8EDEB
		elif [ "$1" = "mint" ]
			then
			FRAME_COLOUR=D8E2DC
		elif [ "$1" = "mute" ]
			then
			FRAME_COLOUR=E8E8E4
		elif [ "$1" = "peach" ]
			then
			FRAME_COLOUR=FFD7BA
		elif [ "$1" = "orange" ]
			then
			FRAME_COLOUR=FEC89A
		elif [ "$1" = "forest" ]
			then
			FRAME_COLOUR=6B705C
		elif [ "$1" = "greyn" ]
			then
			FRAME_COLOUR=B7B7A4
		elif [ "$1" = "dom" ]
			then
			extracted_color=$(dominantcolor.sh -n 2 $file) # if you want to use `dom` option get the script from http://www.fmwconcepts.com/imagemagick/dominantcolor/index.php
			echo "Dominant colour: ${extracted_color:1}"
			FRAME_COLOUR=${extracted_color:1}
		elif [ "$1" = "match" ]
			then
			FRAME_COLOUR=$(convert $file -colorspace rgb -scale 1x1 -depth 8 rgb: | xxd -p -c3) # from https://stackoverflow.com/questions/48300657/get-only-hex-values-from-imagemagick
		elif [ ${(P)+${:-${colour}[$1]}} ] # Technique to check associative array from https://unix.stackexchange.com/a/573660
			then
			FRAME_COLOUR=$colour[$1]
	fi
	echo "converting $file..."
	HEIGHT=$(sips -g pixelHeight $file | grep -o '[0-9]*$') # grep the number, otherwise it's a string with numbers
	WIDTH=$(sips -g pixelWidth $file | grep -o '[0-9]*$')
	if [[ $WIDTH -gt $HEIGHT ]]; then  # Width is greater than Height
		FINAL_HEIGHT=$(( $HEIGHT * $WIDE_FRAME ))
		FINAL_WIDTH=$(( $WIDTH * $NARROW_FRAME ))
		GREATEST=$WIDTH
	elif [[ $WIDTH -lt $HEIGHT ]]; then  # Height is greater than Width
		FINAL_HEIGHT=$(( $HEIGHT * $NARROW_FRAME ))
		FINAL_WIDTH=$(( $WIDTH * $WIDE_FRAME ))
		GREATEST=$HEIGHT
	else  # Image is a square
		FINAL_HEIGHT=$(( $HEIGHT * $WIDE_FRAME ))
		FINAL_WIDTH=$(( $WIDTH * $NARROW_FRAME ))
		GREATEST=$HEIGHT
	fi

	if [ -n "$1" ]; then
			sips -Z $GREATEST -p $FINAL_HEIGHT $FINAL_WIDTH --padColor $FRAME_COLOUR -i $file --out ./framed/${file%.*}_framed_${1}.jpg
		else
			sips -Z $GREATEST -p $FINAL_HEIGHT $FINAL_WIDTH --padColor $FRAME_COLOUR -i $file --out ./framed/${file%.*}_framed.jpg

	fi

	
	echo "$file framed."
done

# Colours from d3Plus, https://cdn.jsdelivr.net/npm/d3plus-text@1

