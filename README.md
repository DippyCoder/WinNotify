# WinNotify

Pops a balloon notification on startup telling you whether your internet is on or off.

## Files

| File | Purpose |
|------|---------|
| `check_internet.ps1` | Pings 8.8.8.8 and shows a system tray balloon tip |
| `check_internet.bat` | Silent launcher — no console window flash |

## Setup

1. Open your Startup folder: `Win + R` → `shell:startup` → Enter
2. Drop a shortcut to `check_internet.bat` in there

Done. It runs automatically on every login.

## Notifications

- **Internet ON** — info balloon, bottom-right corner, stays 10 seconds
- **NO INTERNET** — error balloon, same spot, equally annoying

## Troubleshooting

- **Nothing happens:** Right-click `check_internet.bat` → Properties → Unblock → OK, then try again.
- **"execution policy" error:** The `.bat` already passes `-ExecutionPolicy Bypass`, so this shouldn't happen. If it does, run PowerShell as admin and set `Set-ExecutionPolicy RemoteSigned`.
- **Balloon doesn't appear:** Windows 11 sometimes suppresses balloon tips when Focus Assist is on. Turn it off in Settings → System → Focus.
