# DevSecOps Quick Reference

## Essential Commands

### Docker
```bash
# Container management
docker ps -a                          # List all containers
docker logs -f <container>            # Follow logs
docker exec -it <container> bash      # Execute bash in container
docker system prune -af               # Clean up everything

# Security scanning
trivy image <image-name>              # Scan image for vulnerabilities
docker scan <image-name>              # Docker native scan
```

### Kubernetes
```bash
# Cluster info
kubectl cluster-info
kubectl get nodes
kubectl get pods -A

# Debug
kubectl describe pod <pod-name>
kubectl logs -f <pod-name>
kubectl exec -it <pod-name> -- bash

# Resource usage
kubectl top nodes
kubectl top pods

# Context switching
kubectx                               # List contexts
kubectx <context>                     # Switch context
kubens                                # List namespaces
kubens <namespace>                    # Switch namespace
```

### Terraform
```bash
# Workflow
terraform init
terraform plan -out=tfplan
terraform apply tfplan
terraform destroy

# Security
tfsec .
checkov -d .
terrascan scan -t terraform
```

### AWS
```bash
# Identity
aws sts get-caller-identity
aws configure list

# Common operations
aws ec2 describe-instances
aws s3 ls
aws lambda list-functions
aws ecs list-clusters
```

### Git Security
```bash
# Scan for secrets
gitleaks detect -v
git secrets --scan
trufflehog filesystem .

# Check history
git log --all --full-history --source -- "*password*" "*secret*"
```

### Security Scanning
```bash
# File system scan
trivy fs .
grype dir:.

# Container scanning
trivy image nginx:latest
grype nginx:latest

# Code scanning
semgrep --config=auto .
bandit -r .                           # Python
```

## Useful Functions

### Kubernetes
```bash
kgetall                              # Get all resources in namespace
klogs                                # Interactive pod log viewer
kexec                                # Interactive pod exec
```

### Docker
```bash
dscan <image>                        # Scan Docker image
dclean                               # Remove stopped containers
```

### Security
```bash
secscan                              # Run all security scans
gitscan                              # Scan git repo for secrets
```

### AWS
```bash
awsswitch <profile>                  # Switch AWS profile
awsinfo                              # Show AWS account info
```

## Keyboard Shortcuts

### Tmux
- `Ctrl+A` + `|` - Split vertical
- `Ctrl+A` + `-` - Split horizontal
- `Ctrl+A` + `h/j/k/l` - Navigate panes
- `Ctrl+A` + `r` - Reload config

### Neovim
- `Space` + `e` - File explorer
- `Space` + `ff` - Find files
- `Space` + `fg` - Search text
- `gd` - Go to definition
- `gr` - Find references

## Quick Tips

### Speed up Docker builds
```bash
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
```

### Quick HTTP server
```bash
python3 -m http.server 8000
```

### Generate password
```bash
openssl rand -base64 32
```

### Port forwarding
```bash
kubectl port-forward svc/<service> 8080:80
```

### Base64 encode/decode
```bash
echo "text" | base64
echo "encoded" | base64 -d
```
