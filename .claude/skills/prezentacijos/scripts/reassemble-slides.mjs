// Surenka slides.html iš head.html + slides-src/slide-NN.html (rikiuota) + tail.html.
// Pora su split-slides.mjs. Leisti IŠ prezentacijos aplanko.
import { readFileSync, writeFileSync, readdirSync } from 'fs';

const head = readFileSync('head.html', 'utf8');
const tail = readFileSync('tail.html', 'utf8');
const files = readdirSync('slides-src').filter(f => /^slide-\d+\.html$/.test(f)).sort();
if (!files.length) {
  console.error('KLAIDA: nerasta slides-src/slide-*.html failų');
  process.exit(1);
}
const body = files.map(f => readFileSync(`slides-src/${f}`, 'utf8').trimEnd() + '\n').join('\n');
const out = head.replace(/\n+$/, '') + '\n\n' + body + '\n' + tail;
writeFileSync('slides.html', out);
console.log('surinkta', files.length, 'skaidrių ->', 'slides.html', `(${out.length} baitų)`);
