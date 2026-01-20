#!/bin/bash
set -e

# Path to the profile configuration
PROFILE_PATH="/root/.llxprt/profiles/provision.json"

# Check if environment variables are set and the profile exists
if [ -f "$PROFILE_PATH" ]; then
    echo "Configuring profile with environment variables..."
    
    # Use envsubst to replace ${API_KEY} and ${API_BASEURL} in the file
    # We use a temporary file to avoid issues with reading/writing same file
    envsubst < "$PROFILE_PATH" > "$PROFILE_PATH.tmp" && mv "$PROFILE_PATH.tmp" "$PROFILE_PATH"
else
    echo "Warning: Profile configuration not found at $PROFILE_PATH"
fi

# Pass arguments to llxprt
exec llxprt "$@"