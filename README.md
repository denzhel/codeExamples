# Welcome To My Code Examples Repository

# This reposotiroy created to give you an insight to my recent work.

# On "ArgoCD":
The "app" folder including an umbrella chart of the python app and it's DB (MongoDB) as a dependency.<br />
The "a-o-a.yaml" is an helm chart which using the app of apps pattern to deploy all the neccesarry applications to the cluster.<br />
The  "a-o-a" folder including all of the helm charts below:<br />
    Application <br />
        Python app and MongoDB<br />
    Cert Manager<br />
        Certification Manager for HTTPs.<br />
    Cluster Issuer<br />
        Using "letsencrypt" to issue a certificate.<br />
    EFK Stack:<br />
        For Logging purposes.<br />
    Ingress Control:<br />
        Ngnix as a reverse proxy.<br />
    Prometheus Stack:<br />
        For Monitoring purposes.

# On "Bash", you can find two scripts:
"appTests.sh" which testing the python app with different HTTP methods. <br />
"argoInit.sh" which deploying argo's SCM and updating no-ip DNS to the updated IP of the provisioned EKS cluster. 

# On "Docker", you can dockerfile and docker-compose:
"dockerfile" which dockerize the python app, using python:3.8.2-slim-buster as a base image.<br />
"docker-compose" which used as part of CI pipeline to run an testing environment (DB & App) for testing purposes.

# On "IaaC-TF":
On this folder you can find all of the infrastructe will be provisioned on AWS which including the resources below:<br />
    EKS Cluster:<br />
        3 Nodes<br />
    1 VPC<br />
        2 Public Subnets<br />
        1 Internet Gateway<br />
        1 Route Table<br />
    ArgoCD<br />
    ebsDriver 

# On "Jenkins":
On this folder you can find a Jenkinsfile with the 8 Stages + Post Stage as mentioned below:<br />
1. Clone Stage<br />
    Cloning the source files from two repositories - the application repository and argo's SCM (for the Deploy stage)
2. Tag Calculation Stage<br />
    In case of a push from main branch, Iv'e implemented an semver versioning stage which tagging images which built & tested successfully.
3. Build Stage<br />
    Building the dockerfile.
4. Unit Test Stage<br />
    Using "docker compose up" to run the testing env. and testing getting the docker logs to make sure it's running.
5. E2E Test Stage<br />
    Running E2E tests which includes four HTTP methods:<br />
    GET<br />
    POST<br />
    PUT<br />
    DELETE<br />
    if the status code '200' is will return as a result, the tests will pass successfully.
6. Tagging Stage<br />
    Tagging the image with the tag which calculated on stage 2 with docker & git.
7. Publish Stage<br />
    Publishing the image to AWS container registery service (ECR).
8. Deploy Stage<br />
    Changing the values of argo's SCM to the updated image version, so ArgoCD will pull the change and update the deployment.
9. Post Stage<br />
    Informing the user which pushed the changes to git with the result of the pipeline.

# On "pythonApp":
On this folder you can find a python app which providing an admin panel for teachers, it's html templates and requirements.<br />
The app using four HTTP methods (GET, POST, PUT and DELETE) to get, change or delete data from it's database.<br />
I choose MongoDB as DB for this project.
