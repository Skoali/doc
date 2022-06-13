find -type f \( -iname '*.jpg' -o -iname '*.png' \) -print0 | xargs -0 -I{} -r -n1 -P10 cwebp -m 6 -q 60 -mt -alpha_filter best -short -progress "{}" -o "{}.webp"
rename s/.png.webp/.webp/ *.*
rename s/.jpg.webp/.webp/ *.*
