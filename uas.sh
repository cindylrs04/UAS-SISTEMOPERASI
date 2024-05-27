#!/bin/bash

function install_package {
    echo "Menginstal paket: $1"
    sudo apt install -y $1
}

function remove_package {
    echo "Menghapus paket: $1"
    sudo apt remove -y $1
}

function update_system {
    echo "Memperbarui sistem..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt clean
}

function file_info {
    read -p "Masukkan nama file: " file
    if [ -e "$file" ]; then
        echo "Informasi file: $file"
        ls -l "$file"
        file "$file"
    else
        echo "File tidak ditemukan."
    fi
}

function edit_file {
    read -p "Masukkan nama file untuk diedit: " file
    if [ -e "$file" ]; then
        nano "$file"
    else
        echo "File tidak ditemukan."
    fi
}

function secure_file {
    read -p "Masukkan nama file untuk diamankan: " file
    if [ -e "$file" ]; then
        chmod 600 "$file"
        echo "File $file telah diamankan."
    else
        echo "File tidak ditemukan."
    fi
}

echo "Pilih tindakan:"
echo "1. Instal paket"
echo "2. Hapus paket"
echo "3. Perbarui sistem"
echo "4. Informasi file"
echo "5. Edit file"
echo "6. Amankan file"
read -p "Masukkan pilihan (1/2/3/4/5/6): " choice

case $choice in
    1)
        read -p "Masukkan nama paket yang ingin diinstal: " package
        install_package $package
        ;;
    2)
        read -p "Masukkan nama paket yang ingin dihapus: " package
        remove_package $package
        ;;
    3)
        update_system
        ;;
    4)
        file_info
        ;;
    5)
        edit_file
        ;;
    6)
        secure_file
        ;;
    *)
        echo "Pilihan tidak valid"
        ;;
esac
