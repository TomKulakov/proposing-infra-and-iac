# Infrastructure proposition

## Application components
### Gift card application
Gift card Application with a Website
API for business partners
MySQL (confidential data)

### Fraud prevention application
Fraud prevention application
Redis (confidential data)
Future usage :
- unrelated products
- other business clients

## Proposed solutions

1) k8s infrastructure: 
    a) Deployment for Gift card App
    b) Deployment for API for business partners
    c) Deployment for Fraud prevention app
    d) StatefulSet for Redis (or Memorystore - cloud managed Redis) - it depends how long the data should be kept
2) Load Balancer (to access App, API and in the future, to access Fraud prevention app - currently it will be accessed inside k8s cluster internally)
3) CloudSQL (MySQL) database - simple and cloud managed MySQL database - almost no administration needed
4) GCP Secrets for storing credentials (alternatively Vault or other software installed on k8s cluster)

Based on a budget there should be a separate project for each environment. If not, each environment should be held at least in a different k8s namespaces for isolation of the data and resources limitations. K8s RBAC should be implemented.
CloudSQL secured, proper access role (principle of least privilege) given to selected apps only.

# Implementation
Check `./terraform/README.md` for more details