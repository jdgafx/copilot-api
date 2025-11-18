#!/bin/sh
if [ "$1" = "--auth" ]; then
  # Run auth command
  exec bun run dist/main.js auth
else
  # Build the command with optional parameters
  CMD="bun run dist/main.js start"
  
  # Add GitHub token if provided
  if [ -n "$GH_TOKEN" ]; then
    CMD="$CMD -g $GH_TOKEN"
  fi
  
  # Add account type if provided
  if [ -n "$ACCOUNT_TYPE" ]; then
    CMD="$CMD --account-type $ACCOUNT_TYPE"
  fi
  
  # Add any additional arguments
  CMD="$CMD $@"
  
  # Execute the command
  exec $CMD
fi

