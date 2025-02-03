#!/data/data/com.termux/files/usr/bin/sh

# Install OpenSSH
pkg install -y openssh

# Install Termux-API
pkg install -y termux-api

# Atur password untuk user Termux
echo "Mengatur password user..."
printf "726785\n726785\n" | passwd

# Jalankan SSHD
sshd

# Buat folder boot dan skrip start.sh
mkdir -p ~/.termux/boot
cat <<EOF > ~/.termux/boot/start.sh
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
EOF

# Beri izin eksekusi ke start.sh
chmod +x ~/.termux/boot/start.sh

# Ubah prompt Termux menjadi custom_name@termux
echo 'export PS1="aku@termux:~$ "' >> ~/.bashrc

# Muat ulang file konfigurasi bash untuk menerapkan perubahan
source ~/.bashrc

# Menyampaikan bahwa setup telah selesai
echo "Setup selesai! SSH siap digunakan."
