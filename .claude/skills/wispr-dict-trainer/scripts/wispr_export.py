#!/usr/bin/env python3
"""Eksportuoja Wispr Flow transkripcijų istoriją analizei.

Skaito flow.sqlite TIK skaitymo režimu, išmeta pasirinktos kalbos (numatyta LT
ir nenustatytos) įrašus į JSON chunk'us, kuriuos Claude agentai skanuoja
ieškodami neteisingai atpažintų žodžių.

Veikia macOS ir Windows (ir Linux). Bazės kelias parenkamas pagal OS.

Naudojimas:
  python3 wispr_export.py                       # visa LT istorija
  python3 wispr_export.py --since 2026-07-01
  python3 wispr_export.py --out /tmp/wispr-scan --chunks 5
  python3 wispr_export.py --lang all            # visos kalbos
"""
import argparse
import json
import os
import platform
import sqlite3
import sys
from pathlib import Path


def db_path() -> Path:
    """Wispr Flow SQLite kelias pagal operacinę sistemą."""
    system = platform.system()
    if system == "Darwin":
        return Path.home() / "Library/Application Support/Wispr Flow/flow.sqlite"
    if system == "Windows":
        base = os.environ.get("APPDATA")
        root = Path(base) if base else Path.home() / "AppData/Roaming"
        return root / "Wispr Flow" / "flow.sqlite"
    # Linux ir kt. (Electron numatytas kelias)
    return Path.home() / ".config/Wispr Flow/flow.sqlite"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--since", default=None, help="YYYY-MM-DD, imti tik naujesnius įrašus")
    ap.add_argument("--out", default="/tmp/wispr-scan", help="išvesties katalogas")
    ap.add_argument("--chunks", type=int, default=5)
    ap.add_argument("--lang", default="lt",
                    help="kalbos filtras: 'lt' (LT + nenustatyta), 'all' (visos), arba kodas pvz. 'en'")
    args = ap.parse_args()

    db = db_path()
    if not db.exists():
        print(f"Nerasta Wispr Flow bazė: {db}", file=sys.stderr)
        print("Įsitikink, kad Wispr Flow įdiegta ir bent kartą naudota.", file=sys.stderr)
        return 1

    con = sqlite3.connect(f"file:{db}?mode=ro", uri=True)
    con.row_factory = sqlite3.Row
    where = [
        "formattedText IS NOT NULL",
        "numWords > 2",
        "isArchived=0",
    ]
    params: list = []
    lang = args.lang.lower()
    if lang == "lt":
        where.append("(detectedLanguage='lt' OR detectedLanguage IS NULL)")
    elif lang != "all":
        where.append("detectedLanguage=?")
        params.append(lang)
    if args.since:
        where.append("timestamp >= ?")
        params.append(args.since)
    rows = [
        dict(r)
        for r in con.execute(
            "SELECT transcriptEntityId AS id, substr(timestamp,1,16) AS ts, app,"
            " asrText, formattedText FROM History"
            f" WHERE {' AND '.join(where)} ORDER BY timestamp",
            params,
        )
    ]
    con.close()

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    size = max(1, (len(rows) + args.chunks - 1) // args.chunks)
    n_written = 0
    for i in range(args.chunks):
        chunk = rows[i * size : (i + 1) * size]
        if not chunk:
            break
        (out / f"chunk{i + 1}.json").write_text(
            json.dumps(chunk, ensure_ascii=False), encoding="utf-8"
        )
        n_written += 1
        print(f"chunk{i + 1}.json: {len(chunk)} įrašų")
    print(f"Viso: {len(rows)} įrašų, {n_written} chunk'ų kataloge {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
