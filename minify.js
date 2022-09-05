const fs = require('fs')
const posthtml = require('posthtml')
const htmlnano = require('htmlnano')
const presetMax = require('htmlnano').presets.max
const minifyClassnames = require('posthtml-minify-classnames')

const TO_INLINE = [
  ['./icons.woff2', 'data:application/octet-stream;base64,'],
  ['pfp.jpg', 'data:image/jpeg;base64,'],
]

const main = async (filename) => {
    let html = fs.readFileSync(filename, 'utf8')
      .replaceAll('data-name', 'data-n')
      .replaceAll('dataset.name', 'dataset.n')
      .replaceAll('data-domain', 'data-d')
      .replaceAll('dataset.domain', 'dataset.d')
      .replaceAll('data-tld', 'data-t')
      .replaceAll('dataset.tld', 'dataset.t')

    TO_INLINE.forEach(([name, prefix]) => {
      const base64 = fs.readFileSync(name, 'base64')
      html = html.replaceAll(name, prefix + base64)
    })

    posthtml([
        minifyClassnames({
            filter: /fa/,
            genNameClass: 'genName',
            genNameId: 'genName',
        }),
        htmlnano(presetMax),
    ])
    .process(html)
    .then(function (result) {
        console.log(result.html)
    })
}

main(process.argv[2])
