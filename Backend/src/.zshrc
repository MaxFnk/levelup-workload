# Initialize Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize Atuin
eval "$(atuin init zsh)"

# Function to get the current Git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# Function to get the Git repository name (folder name inside .git)
parse_git_repo_name() {
    git rev-parse --show-toplevel 2>/dev/null | xargs basename
}

# Color Definitions
COLOR_DEF='%f'
COLOR_USR='%F{243}'  # Custom color for username
COLOR_DIR='%F{197}'  # Custom color for directory
COLOR_REPO='%F{46}'  # Custom color for repository name
COLOR_GIT='%F{39}'   # Custom color for Git branch

# Newline and Prompt Substitution
NEWLINE=$'\n'
setopt PROMPT_SUBST

# Set the prompt with username, directory, repo name, and git branch
export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}$(parse_git_repo_name) ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

echo 'export DOTNET_ROOT=/usr/local/share/dotnet' >> ~/.zshrc
echo 'export PATH=$DOTNET_ROOT:$PATH' >> ~/.zshrc
