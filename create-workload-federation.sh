PROJECT_ID="learngcp-418900"
WORKLOAD_IDENTITY_POOL_ID="projects/993297422782/locations/global/workloadIdentityPools/github"
REPO="bhuy-organization222/fe-repo"
GITHUB_ORG="bhuy-organization222"
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


gcloud iam service-accounts add-iam-policy-binding storage-admin-bhuy@learngcp-418900.iam.gserviceaccount.com \
  --project="${PROJECT_ID}" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/993297422782/locations/global/workloadIdentityPools/github/attribute.repository/bhuy-organization222/fe-repo"

#-> principalSet not show role in console


# gcloud iam service-accounts get-iam-policy storage-admin-bhuy@learngcp-418900.iam.gserviceaccount.com \
#   --project="${PROJECT_ID}"

gcloud projects get-iam-policy ${PROJECT_ID} --flatten="bindings[].members" --format='table(bindings.role)' --filter="bindings.members:storage-admin-bhuy@learngcp-418900.iam.gserviceaccount.com"

#  TODO: replace ${PROJECT_ID} with your value below.
# gcloud secrets create my-secret --replication-policy="automatic" --project="${PROJECT_ID}"

# echo -n "aaaa" | gcloud secrets versions add "my-secret" --data-file=- --project="${PROJECT_ID}"

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

# gcloud secrets add-iam-policy-binding "my-secret" \
#   --project="${PROJECT_ID}" \
#   --role="roles/secretmanager.secretAccessor" \
#   --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"


# Updated IAM policy for secret [my-secret].
# bindings:
# - members:
#   - principalSet://iam.googleapis.com/projects/993297422782/locations/global/workloadIdentityPools/github/attribute.repository/bhuy-organization222/fe-repo
#   role: roles/secretmanager.secretAccessor
# etag: BwYYkoKx-Us=
# version: 1