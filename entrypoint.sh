#!/bin/bash
set -e

# Default values if not provided via environment variables
PROVIDER=${PROVIDER:-"openai"}
MODEL=${MODEL:-"gpt-4o"}

# Build the command arguments
ARGS=""

if [ -n "$API_BASEURL" ]; then
    ARGS="$ARGS --baseurl $API_BASEURL"
fi

if [ -n "$API_KEY" ]; then
    # llxprt might expect specific env vars or arguments depending on provider
    # For generic OpenAI compatible, we export the key as OPENAI_API_KEY
    export OPENAI_API_KEY="$API_KEY"
    
    # Also support passing key via argument if needed (check llxprt documentation)
    # ARGS="$ARGS --key $API_KEY"
fi

# Pass any additional arguments from docker run command
exec llxprt "$@" $ARGS
