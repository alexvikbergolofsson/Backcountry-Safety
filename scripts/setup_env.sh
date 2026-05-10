#!/bin/bash

# --- TOOL INSTALLATION ---
# 1. Install Firebase CLI if missing
if ! command -v firebase &> /dev/null; then
    echo "Firebase CLI not found. Installing..."
    curl -sL https://firebase.tools | bash
fi

# 2. Install Google Cloud SDK if missing
if ! command -v gcloud &> /dev/null; then
    echo "GCloud SDK not found. Installing..."
    curl https://sdk.cloud.google.com | bash > /dev/null
    # Add gcloud to the current path for this session
    export PATH=$PATH:$HOME/google-cloud-sdk/bin
fi

# --- ORIGINAL LOGIC ---
echo "Setting up Firebase environment..."
# Using --non-interactive to prevent Jules from getting stuck on login prompts
firebase use backcountry-stability-prod --non-interactive || echo "Firebase project switch failed, check credentials."

if [ ! -d "apps/consumer/lib" ]; then
  echo "Scaffolding Flutter app..."
  mkdir -p apps/consumer
  cd apps/consumer
  flutter create . --org com.backcountry.stability --platforms=ios,android
  flutter pub add mapbox_gl firebase_core firebase_auth
  cd ../..
else
  echo "Flutter app already initialized."
fi

echo "Enabling GCP APIs..."
gcloud services enable aiplatform.googleapis.com bigquery.googleapis.com

if ! bq show backcountry_observations > /dev/null 2>&1; then
  echo "Creating BigQuery dataset..."
  bq mk --dataset backcountry_observations
else
  echo "BigQuery dataset already exists."
fi
