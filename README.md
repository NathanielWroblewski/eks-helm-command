# EKS Helm Command GitHub Action

This GitHub action uses AWS CLI to login to EKS and execute arbitrary commands with helm, aws, and k8s contexts.

## Inputs
Input parameters allow you to specify data that the action expects to use during runtime.

- `aws-access-key-id`: AWS access key id credential. This is used to login to EKS. (required)
- `aws-secret-access-key`: AWS secret access key credential. This is used to login to EKS. (required)
- `aws-region`: AWS region to use. This must match the region of your EKS cluster. (default: us-east-2)
- `cluster-name`: The name of your EKS cluster. (required)
- `cluster-role-arn`: If you wish to assume an admin role, provide the role ARN here.
- `command`: The command you wish to run, e.g. `helm install my-app ./helm/`

## Example usage

```yaml
uses: nathanielwroblewski/eks-helm-command@v1
with:
  aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
  aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  aws-region: us-east-2
  cluster-name: my-eks-cluster
  command: >
    helm upgrade --install my-app ./helm/
      --wait
      --atomic
      --timeout 15m0s
      -f ./helm/values.yml
      -n my-namespace
      --set foo=bar,bar=baz
      --debug
      --dry-run
```
