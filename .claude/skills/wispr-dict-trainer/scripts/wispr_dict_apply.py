#!/usr/bin/env python3
"""Įrašo patvirtintus žodyno įrašus į Wispr Flow Dictionary lentelę.

Veikia macOS ir Windows (ir Linux). Bazės kelias ir programos tikrinimas
parenkami pagal OS.

Saugikliai:
  - atsisako dirbti, kol Wispr Flow programa paleista (WAL konfliktai)
  - prieš rašydamas pasidaro pilną DB kopiją į backups-manual/
  - dublikatų (phrase jau yra) neliečia, tik praneša
  - be --apply veikia dry-run režimu (tik parodo, ką darytų)

Įvestis: JSON masyvas [{"phrase": "...", "replacement": null | "..."}]

Naudojimas:
  python3 wispr_dict_apply.py proposals.json           # dry-run
  python3 wispr_dict_apply.py proposals.json --apply   # tikras įrašymas
"""
import argparse
import datetime
import json
import os
import platform
import shutil
import sqlite3
import subprocess
import sys
import uuid
from pathlib import Path

TEAM_ID = "00000000-0000-0000-0000-000000000000"


def app_dir() -> Path:
    """Wispr Flow duomenų katalogas pagal operacinę sistemą."""
    system = platform.system()
    if system == "Darwin":
        return Path.home() / "Library/Application Support/Wispr Flow"
    if system == "Windows":
        base = os.environ.get("APPDATA")
        root = Path(base) if base else Path.home() / "AppData/Roaming"
        return root / "Wispr Flow"
    return Path.home() / ".config/Wispr Flow"


def wispr_running() -> bool:
    """Ar Wispr Flow procesas paleistas (kad nerašytume į aktyvią DB)."""
    if platform.system() == "Windows":
        r = subprocess.run(
            ["tasklist", "/FI", "IMAGENAME eq Wispr Flow.exe"],
            capture_output=True, text=True,
        )
        return "Wispr Flow.exe" in (r.stdout or "")
    # macOS / Linux
    r = subprocess.run(["pgrep", "-f", "Wispr Flow"], capture_output=True)
    return r.returncode == 0


def now_stamp() -> str:
    dt = datetime.datetime.now(datetime.timezone.utc)
    return dt.strftime("%Y-%m-%d %H:%M:%S.") + f"{dt.microsecond // 1000:03d} +00:00"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("proposals", help="JSON failas su [{phrase, replacement}]")
    ap.add_argument("--apply", action="store_true", help="tikrai įrašyti (kitaip dry-run)")
    args = ap.parse_args()

    app = app_dir()
    db_path = app / "flow.sqlite"
    backup_dir = app / "backups-manual"

    if not db_path.exists():
        print(f"Nerasta Wispr Flow bazė: {db_path}", file=sys.stderr)
        return 1

    entries = json.loads(Path(args.proposals).read_text(encoding="utf-8"))
    if not isinstance(entries, list) or not entries:
        print("Tuščias arba blogas proposals failas", file=sys.stderr)
        return 1
    for e in entries:
        if not e.get("phrase") or len(e["phrase"]) > 255:
            print(f"Blogas įrašas: {e}", file=sys.stderr)
            return 1

    if args.apply and wispr_running():
        print("Wispr Flow paleista. Uždaryk programą (meniu juosta -> Quit) ir kartok.",
              file=sys.stderr)
        return 2

    con = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
    existing = {r[0].lower() for r in con.execute(
        "SELECT phrase FROM Dictionary WHERE isDeleted=0")}
    con.close()

    new = [e for e in entries if e["phrase"].lower() not in existing]
    dupes = [e["phrase"] for e in entries if e["phrase"].lower() in existing]
    if dupes:
        print(f"Jau žodyne ({len(dupes)}): {', '.join(dupes)}")
    if not new:
        print("Nieko naujo įrašyti.")
        return 0

    print(f"{'ĮRAŠOMA' if args.apply else 'DRY-RUN, būtų įrašoma'} ({len(new)}):")
    for e in new:
        repl = f" -> {e['replacement']}" if e.get("replacement") else ""
        print(f"  {e['phrase']}{repl}")
    if not args.apply:
        print("\nPaleisk su --apply, kad įrašytų.")
        return 0

    backup_dir.mkdir(exist_ok=True)
    stamp = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
    backup = backup_dir / f"flow-{stamp}.sqlite"
    src = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
    dst = sqlite3.connect(backup)
    src.backup(dst)
    dst.close()
    src.close()
    print(f"Backup: {backup}")

    con = sqlite3.connect(db_path)
    ts = now_stamp()
    for e in new:
        con.execute(
            "INSERT INTO Dictionary (id, phrase, replacement, teamDictionaryId,"
            " frequencyUsed, remoteFrequencyUsed, manualEntry, createdAt, modifiedAt,"
            " isDeleted, source, isSnippet, isStarred)"
            " VALUES (?, ?, ?, ?, 0, 0, 1, ?, ?, 0, 'manual', 0, 0)",
            (str(uuid.uuid4()), e["phrase"], e.get("replacement"), TEAM_ID, ts, ts),
        )
    con.commit()
    con.close()
    print(f"Įrašyta {len(new)}. Paleidus Wispr Flow, įrašai susisinchronizuos su cloud.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
