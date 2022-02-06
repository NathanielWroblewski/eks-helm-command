#!/usr/bin/env bash -e

if [ -n "$CLUSTER_ROLE_ARN" ]; then
  aws eks --region ${AWS_REGION} update-kubeconfig --name ${CLUSTER_NAME} --role-arn=${CLUSTER_ROLE_ARN}
else
  aws eks --region ${AWS_REGION} update-kubeconfig --name ${CLUSTER_NAME}
fi

helm dependency update ${CHART_PATH}

${COMMAND}
