# 🔥 FLARECLOUD | LOGIN TOOL

Welcome to the **FlareCloud Login Tool**! This is a compact, high-performance CLI utility designed to seamlessly inject Minecraft access tokens directly into your **Prism Launcher** accounts config without having to deal with annoying manual logins or copy-paste errors.

---

## ⚡ Quick Start (1-Minute Guide)

1. **Get your token files**: Put your Minecraft token files (`.txt` files containing `eyJ...` tokens) directly into this folder.
2. **Run the tool**: 
   - Double-click **`Run Me.bat`** (or execute **`mc_token.exe`** if you compiled it).
3. **Select & Inject**:
   - Use your **Arrow Keys** (↑/↓) to select the account you want to use.
   - Press **Enter** to verify and inject it!
   - Prism Launcher will start automatically with your account logged in and ready to play!

---

## 🌟 Key Features

* **📦 Automatic Token Detection**: Just drop your `.txt` files containing tokens in the folder—no manual copying or pasting required.
* **👥 Multi-Profile Selection**: If a token is linked to multiple Minecraft Java names/profiles, the tool detects it and prompts you to select which profile you want to play on.
* **🧹 Expired Launcher Clean**: Automatically scans your `accounts.json` and deletes any expired launcher profiles so your Prism account list stays clean and uncluttered.
* **🗑️ Auto-Purge Dead Tokens**: 
  - Automatically deletes token `.txt` files that have expired timestamps.
  - Automatically deletes token `.txt` files if the Minecraft API rejects them during verification.
* **🔒 Native C compilation (Executable)**: Can be compiled to a native Windows machine-code `.exe` that runs standalone and blocks reverse engineering completely.

---

## 🛠️ Requirements & Setup

* **Prism Launcher**: Installed on Windows (either default installer or local AppData location).
* **Python 3.10+** (only needed if running the `.py` source file):
  - Make sure you check the **"Add Python to PATH"** box during Python installation.

---

## 📂 Troubleshooting FAQ

#### ❓ The tool says: "No token .txt files found"
* Make sure your token text files have the word `token` in their filenames (for example: `alt_token.txt` or `mytoken.txt`).
* Make sure they contain a valid JWT string starting with `eyJ...`.

#### ❓ "API Verification Failed" / "Token REJECTED by Minecraft"
* The token has been invalidated by Microsoft (e.g. because the account owner changed the password, signed out, or the session was revoked).
* The tool will automatically delete this dead file so you don't try it again. Grab a fresh token!

#### ❓ Compilation failed with "Access Denied" (WinError 5)
* Close any instances of `mc_token.exe` that are running in your Command Prompt and re-run `Build Secure EXE.bat`.

---

### 💬 Need Help?
Join our community for fresh accounts, alts, and community tools:
👉 **[discord.gg/fcop](https://discord.gg/fcop)**
