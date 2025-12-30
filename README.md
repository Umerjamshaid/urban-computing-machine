# Simple Git Workflow Guide

This guide explains the basic Git commands you've used and how to manage your branches.

## Key Concepts

*   **`main` branch**: This is your primary branch. It should always contain the stable, working version of your project.
*   **Feature branch**: A temporary branch created from `main` to work on a new feature (like your `feature/splash-screen` branch). This keeps your `main` branch clean while you work.

## Basic Commands

*   `git status`: Shows the current status of your repository (which files are changed, staged, etc.).
*   `git add .`: Stages all new and modified files to be included in the next commit.
*   `git commit -m "Your message"`: Saves your staged changes to the repository with a descriptive message.
*   `git push`: Uploads your committed changes to a remote repository like GitHub.

## Branching and Merging Workflow

Here are the steps to create a feature branch, make changes, and merge it back into `main`.

### 1. Create a Feature Branch

To start working on a new feature, you create a new branch from `main`.

```bash
# Switch to the main branch
git checkout main

# Create and switch to a new feature branch
git checkout -b <branch-name>
# Example: git checkout -b feature/add-login-page
```

### 2. Make Changes and Push Your Branch

Make your code changes, then commit and push them to the feature branch on GitHub.

```bash
# After making changes, stage them
git add .

# Commit the changes
git commit -m "feat: Add new feature"

# Push the new branch to the remote repository (GitHub)
git push -u origin <branch-name>
```

### 3. Merge Your Feature into `main`

Once you are happy with your feature, you merge it into the `main` branch.

```bash
# Switch back to the main branch
git checkout main

# Merge the feature branch into main
git merge <branch-name>
# Example: git merge feature/splash-screen

# Push the updated main branch to GitHub
git push origin main
```

This process keeps your project organized and your `main` branch stable.