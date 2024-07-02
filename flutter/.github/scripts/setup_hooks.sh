#!/bin/bash

# Define the directory containing sample hooks
SAMPLE_HOOKS_DIR=".github/hooks"

# Define the target directory for Git hooks
GIT_HOOKS_DIR=".git/hooks"

# Function to copy or replace hooks
copy_or_replace_hooks() {
    for hook in "$SAMPLE_HOOKS_DIR"/*; do
        hook_name=$(basename "$hook")
        target_hook="$GIT_HOOKS_DIR/"
        if [ -f "$target_hook" ]; then
            echo "Replacing existing hook: $hook_name"
        else
            echo "Copying new hook: $hook_name"
        fi
        if [ -L "$target_hook$hook_name" ]; then
            rm -r $target_hook$hook_name
        fi

        cp $hook $target_hook
        chmod +x $target_hook$hook_name  # Ensure executable permission is set
    done

    git config --unset core.hooksPath
}

# Main function
main() {
    # Check if .git/hooks directory exists
    if [ ! -d "$GIT_HOOKS_DIR" ]; then
        echo "Error: .git/hooks directory not found. Are you in a Git repository?"
        exit 1
    fi

    # Copy or replace hooks
    copy_or_replace_hooks

    echo "Git hooks setup complete."
}

# Run the main function
main