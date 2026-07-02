#!/usr/bin/env bash

SOURCE="Gambar-PDF"
OUTPUT="HASIL-PDF"

mkdir -p "$OUTPUT"

# ==========================
# Cek ImageMagick
# ==========================
if ! command -v magick >/dev/null 2>&1; then
    echo "❌ ImageMagick belum terinstall!"
    echo "Install:"
    echo "sudo apt install imagemagick"
    exit 1
fi

# ==========================
# Ambil semua file gambar
# ==========================
shopt -s nullglob nocaseglob

FILES=(
    "$SOURCE"/*.jpg
    "$SOURCE"/*.jpeg
    "$SOURCE"/*.png
)

TOTAL=${#FILES[@]}

if [ "$TOTAL" -eq 0 ]; then
    echo "⚠ Tidak ada gambar pada folder '$SOURCE'"
    exit 0
fi

SUCCESS=0
FAILED=0

START=$(date +%s)

spinner() {
    local pid=$1
    local text="$2"
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'

    while kill -0 "$pid" 2>/dev/null; do
        for ((i=0;i<${#spin};i++)); do
            printf "\r%c %s" "${spin:$i:1}" "$text"
            sleep 0.07
        done
    done

    printf "\r\033[K"
}

clear

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                 IMAGE TO PDF CONVERTER v1.0                 ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo
echo "📂 Source : $SOURCE"
echo "📁 Output : $OUTPUT"
echo "📄 Total  : $TOTAL File"
echo
echo "──────────────────────────────────────────────────────────────"

COUNT=0

for IMG in "${FILES[@]}"
do
    ((COUNT++))

    FILE=$(basename "$IMG")
    NAME="${FILE%.*}"

    magick "$IMG" "$OUTPUT/$NAME.pdf" >/dev/null 2>&1 &
    PID=$!

    spinner "$PID" "[$COUNT/$TOTAL] Converting $FILE"

    wait "$PID"

    if [ $? -eq 0 ]; then
        printf "✔ %-45s DONE\n" "$FILE"
        ((SUCCESS++))
    else
        printf "✖ %-45s FAILED\n" "$FILE"
        ((FAILED++))
    fi
done

END=$(date +%s)
TIME=$((END-START))

SIZE=$(du -sh "$OUTPUT" | cut -f1)

echo
echo "══════════════════════════════════════════════════════════════"
echo "                     CONVERSION REPORT"
echo "══════════════════════════════════════════════════════════════"

printf " %-18s : %d\n" "Total File" "$TOTAL"
printf " %-18s : %d\n" "Success" "$SUCCESS"
printf " %-18s : %d\n" "Failed" "$FAILED"
printf " %-18s : %ss\n" "Execution Time" "$TIME"
printf " %-18s : %s\n" "Output Folder" "$OUTPUT"
printf " %-18s : %s\n" "Output Size" "$SIZE"

echo "══════════════════════════════════════════════════════════════"

if [ "$FAILED" -eq 0 ]; then
    echo
    echo "🎉 Semua file berhasil dikonversi!"
else
    echo
    echo "⚠ Selesai dengan $FAILED file gagal dikonversi."
fi

echo
