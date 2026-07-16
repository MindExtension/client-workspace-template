// Prezentacijos atvaizdavimas: slides.html -> output/<aplanko-vardas>.pdf
// PNG eksportas tik su --png vėliava (naudojamas tik dizaino peržiūrai, ne kaip rezultatas).
import { chromium } from 'playwright';
import { fileURLToPath } from 'url';
import { dirname, join, basename } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const outputDir = join(__dirname, 'output');
const SLUG = basename(__dirname);

const PNG_MODE = process.argv.includes('--png');

const browser = await chromium.launch();
// PNG eksportui reikia 2x raiškos, PDF yra vektorinis, tad 1x pakanka.
const context = await browser.newContext({
  viewport: { width: 1920, height: 1080 },
  deviceScaleFactor: PNG_MODE ? 2 : 1,
});
const page = await context.newPage();

const htmlPath = `file://${join(__dirname, 'slides.html')}`;
await page.goto(htmlPath, { waitUntil: 'load' });
await page.evaluate(() => document.fonts.ready);
// Palaukiam, kol Mermaid schemos baigs pieštis (jei jų nėra, praleidžiama iškart)
await page.waitForFunction(() => {
  const blocks = document.querySelectorAll('pre.mermaid, .mermaid');
  if (blocks.length === 0) return true;
  return Array.from(blocks).every(b => b.querySelector('svg'));
}, { timeout: 8000 }).catch(() => console.log('  (mermaid laukimas baigėsi, tęsiam)'));
await page.waitForTimeout(200);

const slideCount = await page.locator('section.slide').count();
console.log(`\n[slides.html] ${slideCount} skaidrės`);

if (PNG_MODE) {
  console.log('  PNG režimas (tik peržiūrai)…');
  for (let i = 0; i < slideCount; i++) {
    const num = String(i + 1).padStart(2, '0');
    await page.locator('section.slide').nth(i).screenshot({
      path: join(outputDir, `slide-${num}.png`),
      omitBackground: false,
    });
    console.log(`    ✓ slide-${num}.png`);
  }
}

await page.addStyleTag({
  content: `
    @page { size: 1920px 1080px; margin: 0; }
    html, body { background: white !important; margin: 0 !important; padding: 0 !important; }
    .slide { margin: 0 !important; box-shadow: none !important; break-after: page; page-break-after: always; }
    .slide:last-child { break-after: auto; page-break-after: auto; }
  `,
});
await page.pdf({
  path: join(outputDir, `${SLUG}.pdf`),
  width: '1920px',
  height: '1080px',
  printBackground: true,
  preferCSSPageSize: true,
});
console.log(`  ✓ ${SLUG}.pdf`);

await browser.close();
console.log(`\nBaigta. Rezultatai: ${outputDir}/`);
