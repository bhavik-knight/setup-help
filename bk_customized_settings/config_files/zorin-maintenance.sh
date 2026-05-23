#!/bin/bash


echo "🔄 Refreshing and upgrading DEB packages (APT)..."
sudo apt update -y && sudo apt upgrade -y
echo ""


# Flatpak support (optional)
if command -v flatpak &> /dev/null; then
  echo "📦 Updating Flatpak apps..."
  flatpak update -y
else
  echo "⚠️ Flatpak not installed. Skipping Flatpak updates."
fi
echo ""


# Snap support (optional)
if command -v snap &> /dev/null; then
  echo "📦 Updating Snap packages..."
  sudo snap refresh
else
  echo "⚠️ Snap not installed. Skipping Snap updates."
fi
echo ""


echo "🗑️ Cleanin gAPT package cache..."
sudo apt autoclean -y
echo ""


echo "🧹 Removing unused DEB dependencies..."
sudo apt autoremove -y
echo ""


echo "✅ All maintenance tasks completed!"

