#!/bin/bash

# List of commit types
commit_types=("feat (New Feature)" "fix (Bug Fix)" "docs (Documentation)" "style (Code Style)" "refactor (Code Refactoring)" "test (Tests)" "chore (Chores)")

# Prompt for commit type selection
PS3="Choose a commit type by entering the corresponding number: "
select commit_type in "${commit_types[@]}"; do
   if [[ -n $commit_type ]]; then
       break
   fi
done

# Prompt for ticket number, title, and description with mandatory input
while [[ -z $ticket_number || -z $title || -z $description ]]; do
   read -p "Ticket Number (Max 15 characters, required): " ticket_number
   read -p "Title (Max 50 characters, required): " title
   read -p "Description (Max 300 characters, required): " description
done

# Validate character limits
if [ ${#ticket_number} -gt 15 ] || [ ${#title} -gt 50 ] || [ ${#description} -gt 300 ]; then
   echo "Character limit exceeded. Please keep ticket number (max 15), title (max 50), and description (max 300) within limits."
   exit 1
fi

read -p "Co-Author (If any): " co_author

# Commit message
commit_message="$commit_type - $ticket_number - $title - $description"
echo "$commit_message" > "commit-message.txt"

echo "Commit message written to commit-message.txt"