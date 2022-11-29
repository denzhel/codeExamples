# Welcome To My Code Examples Repository

# This reposotiroy created to give you an insight to my recent work.

# On "ArgoCD":
The "app" folder including an umbrella chart of the python app and it's DB (MongoDB) as a dependency.
The "a-o-a.yaml" is an helm chart which using the app of apps pattern to deploy all the neccesarry applications to the cluster.
The  "a-o-a" folder including all of the helm charts below:
    Application 
        Python app and MongoDB
    Cert Manager
        Certification Manager for HTTPs.
    Cluster Issuer
        Using "letsencrypt" to issue a certificate.
    EFK Stack:
        For Logging purposes.
    Ingress Control:
        Ngnix as a reverse proxy.
    Prometheus Stack:
        For Monitoring purposes.

# On "Bash", you can find two scripts:
"appTests.sh" which testing the python app with different HTTP methods.
"argoInit.sh" which deploying argo's SCM and updating no-ip DNS to the updated IP of the provisioned EKS cluster.

# On "Docker", you can dockerfile and docker-compose:
"dockerfile" which dockerize the python app, using python:3.8.2-slim-buster as a base image.
"docker-compose" which used as part of CI pipeline to run an testing environment (DB & App) for testing purposes.

# On "IaaC-TF":
On this folder you can find all of the infrastructe will be provisioned on AWS which including the resources below:
    EKS Cluster:
        3 Nodes
    1 VPC
        2 Public Subnets
        1 Internet Gateway
        1 Route Table
    ArgoCD
    ebsDriver 

# On "Jenkins":
On this folder you can find a Jenkinsfile with the 8 Stages + Post Stage as mentioned below:
1. Clone Stage
    Cloning the source files from two repositories - the application repository and argo's SCM (for the Deploy stage)
2. Tag Calculation Stage
    In case of a push from main branch, Iv'e implemented an semver versioning stage which tagging images which built & tested successfully.
3. Build Stage
    Building the dockerfile.
4. Unit Test Stage
    Using "docker compose up" to run the testing env. and testing getting the docker logs to make sure it's running.
5. E2E Test Stage
    Running E2E tests which includes four HTTP methods:
    GET
    POST
    PUT
    DELETE
    if the status code '200' is will return as a result, the tests will pass successfully.
6. Tagging Stage
    Tagging the image with the tag which calculated on stage 2 with docker & git.
7. Publish Stage
    Publishing the image to AWS container registery service (ECR).
8. Deploy Stage
    Changing the values of argo's SCM to the updated image version, so ArgoCD will pull the change and update the deployment.
9. Post Stage
    Informing the user which pushed the changes to git with the result of the pipeline.

# On "pythonApp":
On this folder you can find a python app which providing an admin panel for teachers, it's html templates and requirements.
The app using four HTTP methods (GET, POST, PUT and DELETE) to get, change or delete data from it's database.
I choose MongoDB as DB for this project.
