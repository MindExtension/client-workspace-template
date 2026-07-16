// Suskaido slides.html į head.html, tail.html ir slides-src/slide-NN.html (po vieną skaidrę).
// Atgal surenkama su reassemble-slides.mjs. Leisti IŠ prezentacijos aplanko.
// Skaidrių žymės: HTML komentaras, prasidedantis "===== NN " (NN yra numeris).
import { readFileSync, writeFileSync, mkdirSync } from 'fs';

const src = readFileSync('slides.html', 'utf8');
const first = src.match(/<!-- =+ 0*1 /);
if (!first) {
  console.error('KLAIDA: nerasta pirmos skaidrės žymė (komentaras "===== 01 ...")');
  process.exit(1);
}
const head = src.slice(0, first.index);
const tailMatch = src.match(/(<\/body>\s*<\/html>\s*)$/s);
if (!tailMatch) {
  console.error('KLAIDA: nerasta failo pabaiga (</body></html>)');
  process.exit(1);
}
const tail = tailMatch[1];
const body = src.slice(first.index, tailMatch.index);

const parts = body.split(/(?=<!-- =+ \d+ )/);
mkdirSync('slides-src', { recursive: true });
const nums = [];
for (const p of parts) {
  if (!p.includes('<section')) continue;
  const mm = p.match(/<!-- =+ (\d+) /);
  const num = parseInt(mm[1], 10);
  const end = p.lastIndexOf('</section>');
  const sec = p.slice(0, end + '</section>'.length).trimEnd() + '\n';
  writeFileSync(`slides-src/slide-${String(num).padStart(2, '0')}.html`, sec);
  nums.push(num);
}
writeFileSync('head.html', head);
writeFileSync('tail.html', tail);
console.log('skaidrės:', nums.sort((a, b) => a - b).join(', '));
console.log('head baitai:', head.length, 'tail baitai:', tail.length);
