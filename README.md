# 🛡️ Ransomware2.sh — Linux-Only Educational Encryption Tool

> **⚠️ Disclaimer:** This script is for **educational and cybersecurity research purposes only**.  
> Do **not** use it for unethical, illegal, or unauthorized activity.  
> The author is **not responsible** for misuse or data loss.

---

## 📂 What is Ransomware2.sh?

`Ransomware2.sh` is a Linux-only Bash script that simulates ransomware-style encryption and decryption of files and directories. It uses OpenSSL for AES-256-CBC encryption and `tar` for archiving folders.

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
git clone https://github.com/mahajang214/ransomeware2.git
cd ransomeware2
```

2. Make the script executable:

```bash
chmod +x ransomeware2
```

3. Run ransomeware2:

```bash
./ransomeware2 folder password
```

## EXAMPLE

```
chmod +x ransomeware2.sh

# Encrypt a file
./ransomeware2.sh secret.txt password

# Encrypt a folder
./ransomeware2.sh my_folder password

# Decrypt
./ransomeware2.sh secret.txt password
./ransomeware2.sh my_folder password
```

## Tech Stack

**Programming Language** : bash

## Authors

- [@mahajang214](https://www.github.com/mahajang214)
