#!/bin/bash

# --- Установка Zsh ---
sudo apt update -y
sudo apt install -y zsh curl git

# --- Установка Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- Настройка Zsh для пользователя ---
ZSHRC="$HOME/.zshrc"

# Включаем тему agnoster
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' $ZSHRC

# Включаем плагины git и kubectl
sed -i 's/^plugins=.*/plugins=(git kubectl)/' $ZSHRC

# Активируем автодополнение (Oh My Zsh включает его по умолчанию для многих плагинов)
echo "autoload -U compinit && compinit" >> $ZSHRC

# Меняем оболочку пользователя на Zsh
chsh -s $(which zsh)

echo "✅ Zsh, Oh My Zsh с темой agnoster и плагином kubectl установлены!"
exec zsh
