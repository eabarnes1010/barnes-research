#!/bin/bash
set -euo pipefail

echo "Entry point script running"

CONFIG_FILE=_config.yml
DOCKER_DESTINATION=/tmp/_site

# Function to manage Gemfile.lock
manage_gemfile_lock() {
    # The mounted tree is not always a git repo the container can read. Two cases
    # show up in normal use: a repo whose .git is a pointer file to a git
    # directory stored outside the bind mount, and a git worktree, whose .git
    # points outside the mount by definition. In both, git exits 128 with
    # "fatal: not a git repository", which under `set -e` killed this script
    # before Jekyll ever started — the container then crash-looped.
    git config --global --add safe.directory /srv/jekyll >/dev/null 2>&1 || true

    [ -f Gemfile.lock ] || return 0

    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Can't tell whether it's tracked, so keep it. Deleting a tracked
        # Gemfile.lock forces a full re-resolve and loses the pinned versions.
        echo "Not a readable git repo here, keeping Gemfile.lock intact"
        return 0
    fi

    if git ls-files --error-unmatch Gemfile.lock >/dev/null 2>&1; then
        echo "Gemfile.lock is tracked by git, keeping it intact"
        git restore Gemfile.lock 2>/dev/null || true
    else
        echo "Gemfile.lock is not tracked by git, removing it"
        rm Gemfile.lock
    fi
}

ensure_bundle_deps() {
    if bundle check >/dev/null 2>&1; then
        echo "Bundler dependencies already satisfied"
        return
    fi

    echo "Installing missing bundler dependencies"
    bundle install --jobs 4 --retry 3
}

start_jekyll() {
    manage_gemfile_lock
    ensure_bundle_deps
    mkdir -p "$DOCKER_DESTINATION"
    bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling --destination "$DOCKER_DESTINATION" --config "$CONFIG_FILE" &
}

start_jekyll

while true; do
    inotifywait -q -e modify,move,create,delete $CONFIG_FILE
    if [ $? -eq 0 ]; then
        echo "Change detected to $CONFIG_FILE, restarting Jekyll"
        jekyll_pid=$(pgrep -f jekyll)
        kill -KILL $jekyll_pid
        start_jekyll
    fi
done
