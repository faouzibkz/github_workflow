#!/bin/bash

# Check if this is a deployment or a local development run
if [ "$1" == "deploy" ]; then
    echo "🚀 Starting Cloudron deployment..."

    # Ensure we're on the main branch
    git checkout main

    # Add all changes
    git add .

    # Commit changes with a standard message or accept user input
    git commit -m "${2:-'Automated deployment commit'}"

    # Push changes to trigger GitHub Actions and Cloudron deployment
    git push origin main

    echo "✅ Code pushed to GitHub. Deployment process triggered in GitHub Actions."
    
    # Optionally wait for GitHub Actions logs or confirm deployment success
    # You could add logic here to monitor deployment (like checking action status).

else
    echo "👨‍💻 Starting FastAPI app locally..."

    # Run FastAPI locally on 127.0.0.1:8001 with auto-reloading
    uvicorn app.main:app --reload --port=8001
fi
