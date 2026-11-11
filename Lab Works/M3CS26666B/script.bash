#!/bin/bash

# Semak sama ada list.txt wujud
if [[ ! -f "list.txt" ]]; then
  echo "Fail list.txt tidak dijumpai!"
  exit 1
fi

while IFS= read -r nama_folder || [[ -n "$nama_folder" ]]; do
  # Bersihkan nama folder daripada karakter pelik & whitespace
  nama_folder=$(echo "$nama_folder" | tr -cd '[:print:]' | xargs)

  # Langkau baris kosong
  [[ -z "$nama_folder" ]] && continue

  # Buat folder jika belum wujud
  if [[ ! -d "$nama_folder" ]]; then
    mkdir -p "$nama_folder"
    echo "Folder '$nama_folder' telah dicipta."
  else
    echo "Folder '$nama_folder' sudah wujud. Dilangkau."
  fi

  # Cipta README.md dengan heading H1
  echo "# $nama_folder" > "$nama_folder/README.md"
  echo "README.md telah ditambah dalam '$nama_folder'."

done < "list.txt"
