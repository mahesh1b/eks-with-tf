# Provisioning EKS cluster with Terraform 

## Prerequisites
- [X] Terraform Version [1.7.3](https://developer.hashicorp.com/terraform/install)
- [X] [AWS access and secret key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) 
- [X] [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [X] [eksctl](https://eksctl.io/installation/)

## Steps 
1. Inititalize terraform inside the repo
    ```
    terraform init
    ```
2. Add the following variables with value in `terrafrom.tfvars`:
    - `project_name`: name of the project
    - `k8s_version`: eks cluster version
    - `instance_type`: instance type for node group
    - `desired_size`: desired number of worker nodes
    - `min_node`: minimum number of worker nodes
    - `max_node`: maximum number of worker nodes
    - `max_unavailable`: desired max number of unavailable worker nodes during node group update

3. Create EKS cluster
    ```
    terraform apply
    ```
4. Create or update a kubeconfig file for your cluster with `eksctl`
    ```
    aws eks update-kubeconfig --region region-code --name my-cluster
    ```