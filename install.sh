#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${HOME}/.dotfiles-backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

backup_path() {
    local target="$1"
    if [[ -e "$target" || -L "$target" ]]; then
        local relative="${target#"$HOME"/}"
        mkdir -p "$BACKUP_DIR/$(dirname "$relative")"
        cp -a "$target" "$BACKUP_DIR/$relative"
    fi
}

install_path() {
    local source="$1"
    local target="$2"
    backup_path "$target"
    mkdir -p "$(dirname "$target")"
    cp -a "$source" "$target"
}

install_tree() {
    local source="$1"
    local target="$2"
    backup_path "$target"
    mkdir -p "$target"
    cp -a "$source"/. "$target"/
}

echo "Installing dotfiles for $USER in $HOME"
echo "A backup will be saved to: $BACKUP_DIR"

for file in .bashrc .bash_profile .profile .zshrc; do
    install_path "$REPO_DIR/home/$file" "$HOME/$file"
done

for file in "$REPO_DIR"/.config/*; do
    if [[ -d "$file" ]]; then
        install_tree "$file" "$HOME/.config/$(basename "$file")"
    else
        install_path "$file" "$HOME/.config/$(basename "$file")"
    fi
done

read -r -p "Git user name [$(git config --global user.name 2>/dev/null || printf 'YOUR_NAME')]: " git_name
git_name="${git_name:-$(git config --global user.name 2>/dev/null || printf 'YOUR_NAME')}"
read -r -p "Git email [$(git config --global user.email 2>/dev/null || printf 'YOUR_EMAIL@example.com')]: " git_email
git_email="${git_email:-$(git config --global user.email 2>/dev/null || printf 'YOUR_EMAIL@example.com')}"

gitconfig_target="$HOME/.gitconfig"
backup_path "$gitconfig_target"
mkdir -p "$(dirname "$gitconfig_target")"
sed -e "s/^	name = .*/	name = $(printf '%s' "$git_name" | sed 's/[&|]/\\&/g')/" \
    -e "s/^	email = .*/	email = $(printf '%s' "$git_email" | sed 's/[&|]/\\&/g')/" \
    "$REPO_DIR/home/gitconfig.template" > "$gitconfig_target"

install_tree "$REPO_DIR/themes/Colloid" "$HOME/.local/share/themes/Colloid"
install_tree "$REPO_DIR/themes/aurorae/themes" "$HOME/.local/share/aurorae/themes"
install_tree "$REPO_DIR/themes/color-schemes" "$HOME/.local/share/color-schemes"
install_tree "$REPO_DIR/themes/plasma6hex-config/.config" "$HOME/.config"
install_path "$REPO_DIR/themes/plasma6hex-dconf/plasma6hex-gnome-setting.dconf" \
    "$HOME/.local/share/dconf/plasma6hex-gnome-setting.dconf"

echo "Done. Restart affected applications or log in again to apply all settings."
