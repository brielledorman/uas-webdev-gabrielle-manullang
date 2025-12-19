<#
Simple deploy helper for Windows PowerShell.
Usage: .\deploy.ps1 -Message "Commit message"

Notes:
- Assumes git is installed and repo remote `origin` is configured.
- Pushes to `origin` branch `main`.
- If you need a different branch or remote, edit the script accordingly.
#>

param(
    [string]$Message = "Site update"
)

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in PATH. Install Git before running this script."
    exit 1
}

Write-Host "Staging files..."
git add -A

Write-Host "Committing..."
try {
    git commit -m $Message
} catch {
    Write-Warning "Nothing to commit or commit failed. Continuing..."
}

Write-Host "Pushing to origin/main..."
try {
    git push origin main
    Write-Host "Push finished. If this is first push, make sure you created the remote and branch on GitHub."
} catch {
    Write-Error "Push failed. Check that 'origin' remote exists and you have permission to push."
}
