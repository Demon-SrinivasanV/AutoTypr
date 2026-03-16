# AutoTypr 🖊️

AutoTypr is an AutoHotkey script that automatically types the contents of a text file into any active window — keystroke by keystroke. It's designed for environments where clipboard sharing isn't available, such as **VDIs (Virtual Desktop Infrastructure)**, **remote servers**, and **SSH sessions**.

Instead of manually typing out long scripts, config files, code snippets, or commands into a remote environment, you simply paste the content into a local text file and let AutoTypr do the typing for you.

---

## How It Works

When triggered, the script:
1. Reads the contents of a specified text file (`AutoTyprContent.txt`)
2. Forces CapsLock off to prevent casing issues
3. Normalises line endings for cross-platform compatibility
4. Types the content character by character into whatever window is currently focused, preserving all newlines

---

## Installation

### Step 1 — Install AutoHotkey

1. Go to the [AutoHotkey download page](https://www.autohotkey.com/download/)
2. Download and run the **AutoHotkey v1.1** installer (this script uses AHK v1 syntax)
3. Follow the installer prompts and complete the installation

> ⚠️ **Important:** This script is written for **AutoHotkey v1.1**, not v2. Using v2 will cause errors. Make sure you download the correct version.

### Step 2 — Download the Script

Clone this repository or download `AutoTyprScript.ahk` directly:

```bash
git clone https://github.com/Demon-SrinivasanV/AutoTypr.git
```

Or click **Code → Download ZIP** on the GitHub page and extract it.

### Step 3 — Set Up the Content File

Create a plain text file at the following path:

```
C:\path\to\your\AutoTyprContent.txt
```

This is the file AutoTypr will read from. Paste or type whatever content you want automatically typed into it.

> You can change this path by editing line 4 of `AutoTyprScript.ahk`:
> ```ahk
> FilePath := "C:\path\to\your\AutoTyprContent.txt"
> ```

### Step 4 — Run the Script

Double-click `AutoTyprScript.ahk` to launch it. A small AutoHotkey icon will appear in your system tray, indicating the script is running.

---

## Usage

1. **Prepare your content** — Paste the text you want typed into `AutoTyprContent.txt` and save the file.
2. **Click into the target window** — Switch to your VDI, remote desktop, SSH terminal, or any other window where you want the text to appear. Make sure it's focused and your cursor is placed where you want typing to begin.
3. **Press `Ctrl + Q`** — AutoTypr will immediately begin typing the file's contents into the active window, character by character.

---

## Tips & Notes

- **Do not move your mouse or switch windows** while AutoTypr is typing — since it simulates real keystrokes, any window change will cause text to be typed in the wrong place.
- **Large files will take longer** — because content is typed character by character, very long files may take some time to complete.
- **CapsLock is automatically disabled** before typing begins to prevent incorrect casing, particularly useful in VDI environments where CapsLock state can be unreliable.
- **Line endings are normalised** — Windows-style `\r\n` line endings are automatically converted so that newlines work correctly regardless of how the file was saved.
- To **stop typing mid-way**, you can close the script from the system tray (right-click the AHK icon → Exit) or press the standard AHK suspend/exit shortcuts.

---

## Changing the Hotkey

The default trigger is `Ctrl + Q`. To change it, open `AutoTyprScript.ahk` in a text editor and modify the first line:

```ahk
^q::  ; ^ = Ctrl, q = Q
```

Some common modifier symbols:
| Symbol | Key |
|--------|-----|
| `^` | Ctrl |
| `!` | Alt |
| `+` | Shift |
| `#` | Win |

For example, to use `Ctrl + Shift + T` instead:
```ahk
^+t::
```

---

## Requirements

- Windows OS
- [AutoHotkey v1.1](https://www.autohotkey.com/download/)

---

## License

This project is open source. Feel free to use, modify, and distribute it.
