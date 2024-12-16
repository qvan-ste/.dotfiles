#!/usr/bin/env bash

# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

if command -v git &>/dev/null; then

  # Short-form git commands.
  alias g='git'

  # Add file contents to the index.
  alias ga='git add'

  # Add file contents and update the index not only where the
  # working tree has a file matching <pathspec> but also where the
  # index already has an entry.
  alias gaa='git add --all'

  # Add current directory file contents to the index.
  alias gad='git add .'

  # Add file contents and update the index just where it already has an
  # entry matching <pathspec>.
  alias gau='git add --update'

  # Undo to last commit.
  alias gco='git checkout'

  # Move or rename a file, a directory, or a symlink.
  alias gmv='git mv'

  # Restore working tree files.
  alias grs='git restore'

  # Remove files from the working tree and from the index.
  alias grm='git remove'

  # Initialize and modify the sparse-checkout.
  alias gsc='git sparse-checkout'

  # Clone a repository into a new directory.
  alias gcl='git clone'

  # Create an empty Git repository or reinitialize an existing one.
  alias gin='git init'

  # Use binary search to find the commit that introduced a bug.
  alias gbs='git bisect'

  # Show changes between commits, commit and working tree, etc.
  alias gd='git diff'

  # Print lines matching a pattern.
  alias gg='git grep'

  # Show commit logs this month.
  alias gl='git log --since="last month" --oneline'

  # Show commit logs and Draw a text-based graphical representation of
  # the commit history on the left hand side of the output.
  alias glg='git log --oneline --graph --full-history --all --color --decorate'

  # Show status
  alias gst='git status'

  # Show various types of objects.
  alias gsh='git show'
  
  # gb: Create a branch.
  alias gb='git branch'

  # gbd: Delete a branch.
  alias gbd='git branch -d'

  # gbl: List branches.
  alias gbl='git branch -l'

  # gbr: List the remote-tracking branches.
  alias gbr='git branch -r'

  # gct: Record changes to the repository.
  alias gct='git commit'

  # gmg: Join two or more development histories together.
  alias gmg='git merge'

  # grb: Reapply commits on top of another base tip.
  alias grb='git rebase'

  # grs: Reset current HEAD to the specified state.
  alias grs='git reset'

  # gswb: Switch branches.
  alias gs='git switch'

  # Create an empty Git repository or reinitialize an existing one.
  alias gi='git init'

  # Download objects and refs from another repository.
  alias gf='git fetch'

  # Fetch from and integrate with another repository or a local branch.
  alias gp='git pull'

  # Update remote refs along with associated objects.
  alias gph='git push'

  # Commit command to automatically "add" changes from all known files.
  alias gc='git commit -a'

  # Amend the tip of the current branch rather than creating a new
  # commit.
  alias gca='git commit --amend'

  # Commit all changes.
  alias gcall='git add -A && git commit -av'

  # Amend the tip of the current branch, and edit the message.
  alias gcam='git commit --amend --message '

  # Amend the tip of the current branch, and do not edit the message.
  alias gcane='git commit --amend --no-edit'

  # Commit with a message.
  alias gcm='git commit --message '

  # Show changes between the working tree and the index or a tree.
  alias gd='git diff'

  # Show only names and status of changed files.
  alias gdch='git diff --name-status'

  # Show all changes of tracked files which are present in working
  # directory and staging area.
  alias gdh='git diff HEAD'

  # Clean and discard changes and untracked files in working tree.
  alias gclout='git clean -df && git checkout -- .'

  # Switch branches or restore working tree files.
  alias gco='git checkout'

  # Create a new branch named <new_branch> and start it at
  # <start_point>.
  alias gcb='git checkout -b'

  # Delete all local branches that have been merged into the local main
  # branch.
  alias gcode='git checkout main && git branch --merged | xargs git branch --delete'

  # Ensure local is like the main branch.
  alias gcom='git checkout main && git fetch origin --prune && git reset --hard origin/main'

  # Publish the current branch by pushing it to the remote "origin", and
  # setting the current branch to track the upstream branch.
  alias gpb='git push --set-upstream origin $(git current-branch)'

  # Push local changes to the online repository.
  alias gpo='git push origin'

  # Push local tags.
  alias gpt='git push --tags'

  # Manage set of tracked repositories.
  alias gr='git remote'

  # Add a remote named <name> for the repository at <url>.
  alias gra='git remote add'

  # Gives some information about the remote <name>.
  alias grs='git show'

  # Fetch updates for a named set of remotes in the repository as
  # defined by remotes.
  alias gru='git remote update'

  # Remove files from the working tree and from the index.
  alias grm='git rm'

fi
