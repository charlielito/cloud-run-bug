PROJECT_ID="XXX"
SERVICE="cloud-run-test"
IMAGE="gcr.io/$PROJECT_ID/$SERVICE:latest"

CONCURRENCY=1
MEMORY="128Mi"
CPU=1
REGION="us-central1"

gcloud builds submit --config cloudbuild.yaml --substitutions _IMAGE="$IMAGE"

gcloud run deploy \
    $SERVICE \
    --image $IMAGE \
    --allow-unauthenticated \
    --memory $MEMORY \
    --concurrency $CONCURRENCY \
    --cpu $CPU \
    --platform managed \
    --region $REGION 
    # --command "main2.py"
