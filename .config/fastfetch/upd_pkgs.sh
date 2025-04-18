#!/bin/sh

OUTPUT=""
DEST="$HOME/.config/fastfetch/packages_count.txt"

# Create the directory if it doesn't exist
mkdir -p "$(dirname "$DEST")"

# Pacman
if command -v pacman >/dev/null 2>&1; then
    count=$(pacman -Q 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (pacman), "
fi

# DPKG
if command -v dpkg >/dev/null 2>&1; then
    count=$(dpkg -l 2>/dev/null | grep '^ii' | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (dpkg), "
fi

# APT
if command -v apt >/dev/null 2>&1; then
    count=$(apt list --installed 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (apt), "
fi

# RPM
if command -v rpm >/dev/null 2>&1; then
    count=$(rpm -qa 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (rpm), "
fi

# Flatpak
if command -v flatpak >/dev/null 2>&1; then
    count=$(flatpak list --columns=application 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (flatpak), "
fi

# Nix
if command -v nix-env >/dev/null 2>&1; then
    count=$(nix-env -q 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (nix), "
fi

# Snap
if command -v snap >/dev/null 2>&1; then
    count=$(snap list 2>/dev/null | tail -n +2 | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (snap), "
fi

# Homebrew
if command -v brew >/dev/null 2>&1; then
    count=$(brew list 2>/dev/null | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (brew), "
fi

# Cargo
if command -v cargo >/dev/null 2>&1; then
    count=$(cargo install --list 2>/dev/null | grep '^[a-zA-Z0-9_-]\+ v[0-9]' | wc -l)
    [ "$count" -gt 0 ] && OUTPUT="$OUTPUT$count (cargo), "
fi

# Trim trailing comma and space
OUTPUT=$(echo "$OUTPUT" | sed 's/, $//')

# Write to file if OUTPUT is not empty
if [ -n "$OUTPUT" ]; then
    echo "$OUTPUT" > "$DEST"
fi
