#!/bin/bash

# 1. Initialize Firebase
# Using '|| true' ensures the script keeps going if the project is already linked
echo "Setting up Firebase environment..."
firebase use backcountry-safety-prod || firebase use --add backcountry-safety-prod

# 2. Setup Flutter (Only if directory is empty)
if [ ! -d "apps/consumer/lib" ]; then
  echo "Scaffolding Flutter app..."
  mkdir -p apps/consumer
  cd apps/consumer
  flutter create . --org com.backcountry.safety --platforms=ios,android
  flutter pub add mapbox_gl firebase_core firebase_auth
  cd ../..
else
  echo "Flutter app already initialized."
fi

# 3. Initialize GCP Services
echo "Enabling GCP APIs..."
gcloud services enable aiplatform.googleapis.com bigquery.googleapis.com

# 4. BigQuery (Check if dataset exists first)
if ! bq show backcountry_observations > /dev/null 2>&1; then
  echo "Creating BigQuery dataset..."
  bq mk --dataset backcountry_observations
else
  echo "BigQuery dataset already exists."
fi