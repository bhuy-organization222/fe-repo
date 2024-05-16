!#/bin/bash

PROJECT_ID="learngcp-418900"
WORKLOAD_IDENTITY_POOL_ID="projects/993297422782/locations/global/workloadIdentityPools/github/providers/my-repo"
REPO="learngcp-418900/terraform-gcp"
# TODO: replace ${PROJECT_ID} with your value below.

# gcloud iam workload-identity-pools create "github" \
#   --project="${PROJECT_ID}" \
#   --location="global" \
#   --display-name="GitHub Actions Pool"

# # TODO: replace ${PROJECT_ID} with your value below.

# gcloud iam workload-identity-pools describe "github" \
#   --project="${PROJECT_ID}" \
#   --location="global" \
#   --format="value(name)"


# TODO: replace ${PROJECT_ID} and ${GITHUB_ORG} with your values below.

# gcloud iam workload-identity-pools providers create-oidc "my-repo" \
#   --project="${PROJECT_ID}" \
#   --location="global" \
#   --workload-identity-pool="github" \
#   --display-name="My GitHub repo Provider" \
#   --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository,attribute.repository_owner=assertion.repository_owner" \
#   --attribute-condition="assertion.repository_owner == '${GITHUB_ORG}'" \
#   --issuer-uri="https://token.actions.githubusercontent.com"


# # TODO: replace ${PROJECT_ID} with your value below.

# gcloud iam workload-identity-pools providers describe "my-repo" \
#   --project="${PROJECT_ID}" \
#   --location="global" \
#   --workload-identity-pool="github" \
#   --format="value(name)"

# TODO: replace ${PROJECT_ID}, ${WORKLOAD_IDENTITY_POOL_ID}, and ${REPO}
# with your values below.
#
# ${REPO} is the full repo name including the parent GitHub organization,
# such as "my-org/my-repo".
#
# ${WORKLOAD_IDENTITY_POOL_ID} is the full pool id, such as
# "projects/123456789/locations/global/workloadIdentityPools/github".

gcloud secrets add-iam-policy-binding "my-secret" \
  --project="${PROJECT_ID}" \
  --role="roles/secretmanager.secretAccessor" \
  --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"