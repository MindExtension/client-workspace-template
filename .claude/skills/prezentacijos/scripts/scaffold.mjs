// Naujos prezentacijos karkasas. Veikia ir macOS, ir Windows.
// Naudojimas: node scaffold.mjs /pilnas/kelias/iki/naujos-prezentacijos-aplanko
// Sukuria: slides.html, render.mjs, package.json, fonts/, output/
import { cpSync, mkdirSync, copyFileSync, existsSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join, resolve } from 'path';

const target = process.argv[2];
if (!target) {
  console.error('Nurodyk tikslinį aplanką: node scaffold.mjs /kelias/iki/aplanko');
  process.exit(1);
}
const skillDir = dirname(dirname(fileURLToPath(import.meta.url)));
const dest = resolve(target);

mkdirSync(join(dest, 'output'), { recursive: true });
cpSync(join(skillDir, 'assets', 'fonts'), join(dest, 'fonts'), { recursive: true });
copyFileSync(join(skillDir, 'scripts', 'render.mjs'), join(dest, 'render.mjs'));
copyFileSync(join(skillDir, 'scripts', 'package.json'), join(dest, 'package.json'));
if (!existsSync(join(dest, 'slides.html'))) {
  copyFileSync(join(skillDir, 'templates', 'base.html'), join(dest, 'slides.html'));
} else {
  console.log('slides.html jau yra, neliečiam.');
}
console.log(`Karkasas paruoštas: ${dest}`);
console.log('Toliau: cd į aplanką, npm install, npx playwright install chromium');
