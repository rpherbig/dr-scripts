#!/bin/sh

set -e

handle_local_branch() {
    local branch="$1"
    echo "---handle_local_branch: $1"
    git branch -D $branch
}

handle_remote_branch() {
    local branch="$1"
    echo "---handle_remote_branch: $1"
    git checkout -B $branch origin/$branch
    git merge --strategy=recursive -Xno-renames -Xpatience -Xrenormalize upstream/master
    git push origin
}

# Abort any in-flight merges
git merge --abort || true

# Fetch updates from upstream
git fetch --all --force --prune --prune-tags --no-tags

# Reset master to match upstream
git checkout -B master
git reset --hard upstream/master
git push -u origin master

# Delete local branches to clean up those
# that may have been merged upstream or abandoned
branches=($(git branch --list | grep -Eo "KatoakDR(-\w+)*"))
for branch in ${branches[@]}; do
    echo ""
    handle_local_branch $branch
done

# Update remote branches with upstream
branches=($(git branch --list -r origin/* | grep -Eo "KatoakDR(-\w+)*"))
for branch in ${branches[@]}; do
    echo ""
    handle_remote_branch $branch
done

# Go back to the beginning
git checkout master
