# 🛡️ CyberShield.sh — Linux-Only Educational Encryption Tool

> **⚠️ Disclaimer:** This script is for **educational and cybersecurity research purposes only**.  
> Do **not** use it for unethical, illegal, or unauthorized activity.  
> The author is **not responsible** for misuse or data loss.

---

## 📂 What is CyberShield.sh?

`CyberShield.sh` is a Linux-only Bash script that simulates ransomware-style encryption and decryption of files and directories. It uses OpenSSL for AES-256-CBC encryption and `tar` for archiving folders.

---

## 🧰 Requirements

- **Operating System:** Linux (tested on distributions like Arch, Ubuntu, Fedora)
- **Dependencies:**
  - `openssl`
  - `tar`

Make sure they are installed:

```bash
sudo apt install openssl tar      # Ubuntu/Debian
sudo pacman -S openssl tar        # Arch
sudo dnf install openssl tar      # Fedora
```

## 📖 Usage

## 🚀 Quick Start

1. Clone the repository:

```bash
git clone https://github.com/mahajang214/CyberShield.git
cd CyberShield
```

2. Make the script executable:

```bash
chmod +x CyberShield
```

3. Run CyberShield:

```bash
./CyberShield folder password
```

## EXAMPLE

```
chmod +x CyberShield.sh

# Encrypt a file
./CyberShield.sh secret.txt password

# Encrypt a folder
./CyberShield.sh my_folder password

# Decrypt
./CyberShield.sh secret.txt password
./CyberShield.sh my_folder password
```

## Tech Stack

**Programming Language** : bash

## Authors

- [@mahajang214](https://www.github.com/mahajang214)
