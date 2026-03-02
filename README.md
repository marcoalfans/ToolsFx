# ToolsFx 1.19.0 (Kali Linux, Tuning ID)

Build ini adalah ToolsFx `1.19.0` yang sudah dituning untuk Linux/Kali:
- launcher Linux stabil untuk JavaFX modular (`run-toolsfx-id.sh`)
- locale Indonesia default
- beberapa label/menu China sudah diganti ke Indonesia
- panduan file sudah dirapikan ke nama yang mudah dibaca

## Isi Folder Penting

- `ToolsFx` : launcher asli Linux
- `run-toolsfx-id.sh` : launcher rekomendasi (Indonesia + fix JavaFX)
- `Messages_id.properties` : bundle bahasa Indonesia
- `lib/*.jar` : binary aplikasi dan plugin
- `lib/*.bak` : backup sebelum patch (jika ada)

## Requirement

Minimal:
- Kali Linux / distro Linux sejenis
- Java terpasang (`java -version`)
- OpenJFX terpasang

Install dependency:

```bash
sudo apt update
sudo apt install -y openjfx
```

## Quickstart

Masuk folder aplikasi:

```bash
cd /home/kac0/tools/ToolsFx/ToolsFx-1.19.0-jdk8-all-platform
chmod +x ToolsFx run-toolsfx-id.sh
```

Jalankan (rekomendasi):

```bash
./run-toolsfx-id.sh
```

## Menjadikan Global Command (`toolsfx`)

Buat wrapper global user:

```bash
mkdir -p ~/.local/bin
cat > ~/.local/bin/toolsfx << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /home/kac0/tools/ToolsFx/ToolsFx-1.19.0-jdk8-all-platform/run-toolsfx-id.sh "$@"
EOF
chmod +x ~/.local/bin/toolsfx
```

Pastikan `~/.local/bin` ada di `PATH`:

```bash
echo "$PATH"
```

Jika belum ada, tambahkan di `~/.profile`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Lalu reload shell:

```bash
source ~/.profile
```

Tes:

```bash
toolsfx
```

## Troubleshooting

### 1) Error JavaFX / `IllegalAccessError`
Gunakan launcher ini, jangan `./ToolsFx` langsung:

```bash
./run-toolsfx-id.sh
```

### 2) `WHOIS` error `NullPointerException`
Biasanya karena gagal ambil data dari endpoint IANA (`https://data.iana.org/rdap/dns.json`).

Cek jaringan:

```bash
curl -m 15 https://data.iana.org/rdap/dns.json | head
```

Jika timeout/blocked, fitur WHOIS dapat gagal.

### 3) Ingin kembali ke file original (rollback)
Jika tersedia backup `.bak`, restore manual:

```bash
cd /home/kac0/tools/ToolsFx/ToolsFx-1.19.0-jdk8-all-platform/lib
cp -f app-1.19.0.jar.bak app-1.19.0.jar
cp -f plugin-image-1.3.1.jar.bak plugin-image-1.3.1.jar
cp -f plugin-location-1.3.1.jar.bak plugin-location-1.3.1.jar
```

## Referensi Resmi

- Repo: https://github.com/Leon406/ToolsFx
- Issues: https://github.com/Leon406/ToolsFx/issues
