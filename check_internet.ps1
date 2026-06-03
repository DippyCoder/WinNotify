# check_internet.ps1 — shows a toast notification on startup with internet status

Add-Type -AssemblyName System.Windows.Forms

$connected = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet -ErrorAction SilentlyContinue

if ($connected) {
    $title   = "Internet is ON"
    $message = "You're connected to the internet."
    $icon    = [System.Windows.Forms.ToolTipIcon]::Info
} else {
    $title   = "NO INTERNET"
    $message = "You are NOT connected. Good luck out there."
    $icon    = [System.Windows.Forms.ToolTipIcon]::Error
}

# Build a hidden tray icon just to host the balloon popup
$tray = New-Object System.Windows.Forms.NotifyIcon
$tray.Icon    = [System.Drawing.SystemIcons]::Application
$tray.Visible = $true

# Show balloon tip (the "annoying side popup")
# Duration: 10 000 ms = 10 seconds — long enough to be annoying
$tray.ShowBalloonTip(10000, $title, $message, $icon)

# Keep the script alive long enough for the balloon to display, then clean up
Start-Sleep -Seconds 12
$tray.Visible = $false
$tray.Dispose()
