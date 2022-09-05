# llllvvuu.dev
## Build Fonts
```sh
npm i -g glyphhanger
pip install fonttools brotli zopfli
glyphhanger index.raw.html | awk -v FS=, '{for(i=1;i<=NF;i++)if($i~/F/){printf sep $i;sep=","}}' > glyphhanger_output
pyftsubset assets/fonts/forkawesome-webfont.woff2 --unicodes-file=glyphhanger_output --flavor=woff2 --output-file=icons.woff2
pyftsubset assets/fonts/forkawesome-webfont.woff --unicodes-file=glyphhanger_output --flavor=woff --output-file=icons.woff --with-zopfli
```

## Minify
```sh
node minify.js index.raw.html > index.html
```
