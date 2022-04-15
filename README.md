# borderize 
borderize is a script that adds matting (a border) to images, which makes them fancy 💁‍♂️.

## Right??
![2021_11_22_20211030_DSCF7297__35_borderized_match](https://user-images.githubusercontent.com/17396560/163601446-a7e5ff05-a8fe-4e1b-a505-bccffcff50d3.jpg)

## Requirements
- `sips`

## How to use it
1. Add `borderize.sh` to a folder in your `$PATH`
2. `cd` to a folder with images to borderize
3. `bordersize.sh` to borderize with the default colour, or add an available colour to the command.

For example, 
```
$ borderize.sh mintcream
```

## Actions
The script uses [`sips`](https://ss64.com/osx/sips.html). It runs on all `.jpg` and `.JPG` files in the folder and deposits the new images in a `borderized/` folder. They new images are named `{originalFileName}_borderized_optionalMatColour.jpg`. The original images are not deleted. EXIF data is preserved in the borderized versions.

For landscape-oriented images, the top- and bottom-borders are set to 15% of the height of the original (the new height is set to 1.3 times the original height), and the left- and right-borders are set to 3.5% of the height of the original (the new width is set to 1.07 times the original width). The top and bottom borders are wider than the side borders.

For portrait-oriented images, the top- and bottom-borders are set to 3.5% of the height of the original (the new height is set to 1.07 times the original height). The left- and right-borders are set to 15% of the width of the original (the new width is to 1.3 times the original width). The side borders are wider than the top borders.

For square images, all borders are set to 3.5% of the height of the original.

The default mat colour is `#FFFFFF` white; a number of other options exist.

## Colours
```
[aliceblue]="f0f8ff"
[antiquewhite]="faebd7"
[aqua]="00ffff"
[aquamarine]="7fffd4"
[azure]="f0ffff"
[beige]="f5f5dc"
[bisque]="ffe4c4"
[black]="000000"
[blanchedalmond]="ffebcd"
[blue]="0000ff"
[blueviolet]="8a2be2"
[brown]="a52a2a"
[burlywood]="deb887"
[cadetblue]="5f9ea0"
[chartreuse]="7fff00"
[chocolate]="d2691e"
[coral]="ff7f50"
[cornflowerblue]="6495ed"
[cornsilk]="fff8dc"
[crimson]="dc143c"
[cyan]="00ffff"
[darkblue]="00008b"
[darkcyan]="008b8b"
[darkgoldenrod]="b8860b"
[darkgray]="a9a9a9"
[darkgreen]="006400"
[darkgrey]="a9a9a9"
[darkkhaki]="bdb76b"
[darkmagenta]="8b008b"
[darkolivegreen]="556b2f"
[darkorange]="ff8c00"
[darkorchid]="9932cc"
[darkred]="8b0000"
[darksalmon]="e9967a"
[darkseagreen]="8fbc8f"
[darkslateblue]="483d8b"
[darkslategray]="2f4f4f"
[darkslategrey]="2f4f4f"
[darkturquoise]="00ced1"
[darkviolet]="9400d3"
[deeppink]="ff1493"
[deepskyblue]="00bfff"
[dimgray]="696969"
[dimgrey]="696969"
[dodgerblue]="1e90ff"
[firebrick]="b22222"
[floralwhite]="fffaf0"
[forestgreen]="228b22"
[fuchsia]="ff00ff"
[gainsboro]="dcdcdc"
[ghostwhite]="f8f8ff"
[gold]="ffd700"
[goldenrod]="daa520"
[gray]="808080"
[green]="008000"
[greenyellow]="adff2f"
[grey]="808080"
[honeydew]="f0fff0"
[hotpink]="ff69b4"
[indianred]="cd5c5c"
[indigo]="4b0082"
[ivory]="fffff0"
[khaki]="f0e68c"
[lavender]="e6e6fa"
[lavenderblush]="fff0f5"
[lawngreen]="7cfc00"
[lemonchiffon]="fffacd"
[lightblue]="add8e6"
[lightcoral]="f08080"
[lightcyan]="e0ffff"
[lightgoldenrodyellow]="fafad2"
[lightgray]="d3d3d3"
[lightgreen]="90ee90"
[lightgrey]="d3d3d3"
[lightpink]="ffb6c1"
[lightsalmon]="ffa07a"
[lightseagreen]="20b2aa"
[lightskyblue]="87cefa"
[lightslategray]="778899"
[lightslategrey]="778899"
[lightsteelblue]="b0c4de"
[lightyellow]="ffffe0"
[lime]="00ff00"
[limegreen]="32cd32"
[linen]="faf0e6"
[magenta]="ff00ff"
[maroon]="800000"
[mediumaquamarine]="66cdaa"
[mediumblue]="0000cd"
[mediumorchid]="ba55d3"
[mediumpurple]="9370db"
[mediumseagreen]="3cb371"
[mediumslateblue]="7b68ee"
[mediumspringgreen]="00fa9a"
[mediumturquoise]="48d1cc"
[mediumvioletred]="c71585"
[midnightblue]="191970"
[mintcream]="f5fffa"
[mistyrose]="ffe4e1"
[moccasin]="ffe4b5"
[navajowhite]="ffdead"
[navy]="000080"
[oldlace]="fdf5e6"
[olive]="808000"
[olivedrab]="6b8e23"
[orange]="ffa500"
[orangered]="ff4500"
[orchid]="da70d6"
[palegoldenrod]="eee8aa"
[palegreen]="98fb98"
[paleturquoise]="afeeee"
[palevioletred]="db7093"
[papayawhip]="ffefd5"
[peachpuff]="ffdab9"
[peru]="cd853f"
[pink]="ffc0cb"
[plum]="dda0dd"
[powderblue]="b0e0e6"
[purple]="800080"
[rebeccapurple]="663399"
[red]="ff0000"
[rosybrown]="bc8f8f"
[royalblue]="4169e1"
[saddlebrown]="8b4513"
[salmon]="fa8072"
[sandybrown]="f4a460"
[seagreen]="2e8b57"
[seashell]="fff5ee"
[sienna]="a0522d"
[silver]="c0c0c0"
[skyblue]="87ceeb"
[slateblue]="6a5acd"
[slategray]="708090"
[slategrey]="708090"
[snow]="fffafa"
[springgreen]="00ff7f"
[steelblue]="4682b4"
[tan]="d2b48c"
[teal]="008080"
[thistle]="d8bfd8"
[tomato]="ff6347"
[turquoise]="40e0d0"
[violet]="ee82ee"
[wheat]="f5deb3"
[white]="ffffff"
[whitesmoke]="f5f5f5"
[yellow]="ffff00"
[yellowgreen]="9acd32"
["dark"]r="121212"
["pale"]r="F8EDEB"
["mint"]r="D8E2DC"
["mute"]r="E8E8E4"
["peach"]r="FFD7BA"
["orange"]r="FEC89A"
["forest"]r="6B705C"
["greyn"]r="B7B7A4"
```

Two additional options exist, which extract a colour from the image in slightly different ways. Experiment to see which works best for your image. The sample image was generated using `dom`:
```
["dom"]
["match"]
```

Sample image ©2022 Symon Flaming
