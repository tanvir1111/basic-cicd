#!/bin/bash

# Replace with the repository owner and name
OWNER="torvalds"
REPO="linux"

# GitHub API URL
URL="https://api.github.com/repos/$OWNER/$REPO/commits"

# Fetch commits using curl
response=$(curl -s "$URL")

# Parse and print commit SHA and message using jq
echo "$response" | jq -r '.[] | "Author: \(.commit.author.name)\tMessage: \(.commit.message)\n____________________________________________"'
