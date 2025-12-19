# Waves Within — Project & GitHub Pages deploy

This repo contains a small static site (HTML, CSS, JS, and assets) for the "Waves Within" photobooth project.

This README explains how to prepare and deploy the site to GitHub Pages and includes a small PowerShell helper script (`deploy.ps1`) to simplify pushing to a remote repository.

---

## Important notes before deploy
- File paths are case-sensitive on GitHub Pages (Linux). Make sure references in `index.html` exactly match folder/file names (e.g. `CSS/style.css` not `css/style.css`).
- Ensure all files are committed (including `CSS/`, `js/`, `assets/`).
- If your repo will be served at `https://<username>.github.io/<repo>/` (project pages), you may need to add a `<base href="/repo-name/">` in `<head>` or use relative links.

## Quick manual deploy steps (recommended)
1. Initialize git (if not already):

```powershell
cd "path\to\project\folder"
git init
```

2. Create a repository on GitHub (via UI) and copy the remote URL.

3. Add remote, add files, commit and push:

```powershell
git remote add origin https://github.com/<your-username>/<repo-name>.git
git add -A
git commit -m "Initial site commit"
git branch -M main
git push -u origin main
```

4. Enable GitHub Pages:
- Open your repository on GitHub -> Settings -> Pages
- Under "Source" choose branch `main` and folder `/ (root)` then Save
- Wait a minute, then visit `https://<your-username>.github.io/<repo-name>/`

## Use the helper script (Windows PowerShell)
A simple helper script `deploy.ps1` is included. It will:
- add & commit changes with a message you provide
- push to `origin` on branch `main`

Usage (PowerShell):

```powershell
# run from project root
.\deploy.ps1 -Message "Update: prepare site for GitHub Pages"
```

Note: The script assumes `origin` is set and the branch is `main`. If you haven't set a remote yet, create the remote first (see manual steps above).

## Troubleshooting
- CSS/JS not loading: check path case (CSS vs css), and verify the files exist in repo.
- 404 on index: make sure `index.html` is in the repo root, and `gh-pages`/Pages source is configured correctly.
- Asset problems: ensure `assets/` directory and all filenames are committed and referenced with correct case.
- If your repository name has spaces or unusual characters, consider renaming it to a simple kebab-case name.

## Next steps I can help with
- Scan the project and list file paths that may have case mismatches.
- Create the remote GitHub repository (you must provide the repo name and allow me to show the exact commands; I cannot push on your behalf without credentials).
- Hook the form to a backend or Formspree.

---

If you want, run the provided `deploy.ps1` after setting the remote, or let me scan the repo for potential case mismatches before you push.