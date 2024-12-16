# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Converted from Bash aliases to Fish functions

if type -q git
    # Short-form git commands
    function g
        git $argv
    end

    # Add file contents to the index
    function ga
        git add $argv
    end

    # Add file contents and update the index
    function gaa
        git add --all $argv
    end

    # Add current directory file contents to the index
    function gad
        git add . $argv
    end

    # Add file contents and update the index just where it already has an entry
    function gau
        git add --update $argv
    end

    # Undo to last commit
    function gco
        git checkout $argv
    end

    # Move or rename a file, a directory, or a symlink
    function gmv
        git mv $argv
    end

    # Restore working tree files
    function grs
        git restore $argv
    end

    # Remove files from the working tree and from the index
    function grm
        git rm $argv
    end

    # Initialize and modify the sparse-checkout
    function gsc
        git sparse-checkout $argv
    end

    # Clone a repository into a new directory
    function gcl
        git clone $argv
    end

    # Create an empty Git repository or reinitialize an existing one
    function gin
        git init $argv
    end

    # Use binary search to find the commit that introduced a bug
    function gbs
        git bisect $argv
    end

    # Show changes between commits, commit and working tree, etc.
    function gd
        git diff $argv
    end

    # Print lines matching a pattern
    function gg
        git grep $argv
    end

    # Show commit logs this month
    function gl
        git log --since="last month" --oneline $argv
    end

    # Show commit logs with graph
    function glg
        git log --oneline --graph --full-history --all --color --decorate $argv
    end

    # Show status
    function gst
        git status $argv
    end

    # Show various types of objects
    function gsh
        git show $argv
    end

    # Create a branch
    function gb
        git branch $argv
    end

    # Delete a branch
    function gbd
        git branch -d $argv
    end

    # List branches
    function gbl
        git branch -l $argv
    end

    # List the remote-tracking branches
    function gbr
        git branch -r $argv
    end

    # Record changes to the repository
    function gct
        git commit $argv
    end

    # Join two or more development histories together
    function gmg
        git merge $argv
    end

    # Reapply commits on top of another base tip
    function grb
        git rebase $argv
    end

    # Reset current HEAD to the specified state
    function grs
        git reset $argv
    end

    # Switch branches
    function gs
        git switch $argv
    end

    # Create an empty Git repository or reinitialize an existing one
    function gi
        git init $argv
    end

    # Download objects and refs from another repository
    function gf
        git fetch $argv
    end

    # Fetch from and integrate with another repository or a local branch
    function gp
        git pull $argv
    end

    # Update remote refs along with associated objects
    function gph
        git push $argv
    end

    # Commit command to automatically "add" changes from all known files
    function gc
        git commit -a $argv
    end

    # Amend the tip of the current branch rather than creating a new commit
    function gca
        git commit --amend $argv
    end

    # Commit all changes
    function gcall
        git add -A && git commit -av $argv
    end

    # Amend the tip of the current branch, and edit the message
    function gcam
        git commit --amend --message $argv
    end

    # Amend the tip of the current branch, and do not edit the message
    function gcane
        git commit --amend --no-edit $argv
    end

    # Commit with a message
    function gcm
        git commit --message $argv
    end

    # Show changes between the working tree and the index or a tree
    function gdch
        git diff --name-status $argv
    end

    # Show all changes of tracked files in working directory and staging area
    function gdh
        git diff HEAD $argv
    end

    # Clean and discard changes and untracked files in working tree
    function gclout
        git clean -df && git checkout -- . $argv
    end

    # Switch branches or restore working tree files
    function gcb
        git checkout -b $argv
    end

    # Delete all local branches that have been merged into the local main branch
    function gcode
        git checkout main && git branch --merged | xargs git branch --delete $argv
    end

    # Ensure local is like the main branch
    function gcom
        git checkout main && git fetch origin --prune && git reset --hard origin/main $argv
    end

    # Publish the current branch by pushing it to the remote "origin"
    function gpb
        git push --set-upstream origin (git current-branch) $argv
    end

    # Push local changes to the online repository
    function gpo
        git push origin $argv
    end

    # Push local tags
    function gpt
        git push --tags $argv
    end

    # Manage set of tracked repositories
    function gr
        git remote $argv
    end

    # Add a remote named <name> for the repository at <url>
    function gra
        git remote add $argv
    end

    # Gives some information about the remote <name>
    function grs
        git show $argv
    end

    # Fetch updates for a named set of remotes in the repository
    function gru
        git remote update $argv
    end

    # Remove files from the working tree and from the index
    function grm
        git rm $argv
    end
end
