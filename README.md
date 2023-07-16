# Overview

Hello, I am huy, this is project 2 (CICD) in Nanodegree for DevOps Engineer using MS Azure from Udacity.

This project consists of flask application that is developed to predict housing prices in Boston (the model is already created by the instructor). 

This repositry demonstrate:
- Deploying the app in Azure CloudShell
- Deploying the app as a web server using Azure App Service.

If anything changed in it repository,  it will trigger the Github Action and also the Azure DevOps Pipelines to perform the CICD process and finally deploy to my app service.

## Badge

[![Python application test with Github Actions](https://github.com/tuanhuy33/azure-devops-project2.1/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/tuanhuy33/azure-devops-project2.1/actions/workflows/pythonapp.yml)

## Project Plan

A [Trello](https://trello.com/invite/b/u1T4UgNP/ATTI359c6c9fd0512a2b642617ff36974207E886B257/huy-bui) board to keep track of the tasks.

A [spreadsheet](project-schedule-h.xlsx) to manage the project plan.

## Instructions

Here is an architectural diagram:

![diagram](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/a.png)

## Deploy the app in Azure Cloud Shell

In Azure Cloud Shell, clone the repo:
```
git clone git@github.com:tuanhuy33/azure-devops-project2.1.git
```
![screenshot-gitClone-AzureCloud](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/ssh-clone.png)


Change into the new directory:
```
cd azure-devops-project2.1
```

Change to branch "ci-to-git-action"

```
git checkout ci-to-git-action
```

Create a virtual environment:
```
python3 -m venv ~/.myrepo
```

Activate the virtual environment:
```
source ~/.myrepo/bin/activate
```

Install dependencies in the virtual environment and run tests:
```
make all
```
![make-all](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/python3.png)

Make change and test GitHub action
![screenshot-test-githubaction](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/git_action.png)

## Deploy the app to an Azure App Service

Create an App Service in Azure. 

Use this [file](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/commands.sh) to create new App Services

```
az webapp up -n azure-devops-project2
```

Next, create the pipeline in Azure DevOps. The basic steps are:

- Go to [https://dev.azure.com](https://dev.azure.com) and sign in.
- Create a new private project.
- Create a new service connection to ARM, select subscription and the app service.
- Create a new pipeline linked to your GitHub repo using GiThub YAML File.

Screenshot of the App Service:

![My WebApp](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/web_app.png)

Screenshot of Azure DevOps Project:

![My_DevOps](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/azure_devops..png)

To test the app running in Azure App Service, edit line 28 of the make_predict_azure_app.sh script with the DNS name of your app. Then run the script:
```
./make_predict_azure_app.sh 
```

If it's working you should see the following output:

![screenshot-prediction](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/b.png)

You can also visit the URL of the App Service via the browser and you should see the following page:

![screenshot-browser](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/app.png)

View the app logs:

To view the log in Cloud Shell
```
az webapp log tail -g Azuredevops -n azure-devops-project2-huy
```
![screenshot-log-webapp](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/log_trail.png)


> 

## Load test

I use locust to perform load test on my local computer. 

Install locust:
```
pip install locust
```

Start load test:
```
locust -f locustfile.py --host https://azure-devops-project2-huy.azurewebsites.net/ --users 500 --spawn-rate 5 
```
Open a browser and go to [http://localhost:8089](http://localhost:8089) then click Start Swarming:

![screenshot-loadtest#1](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/run_locust.png)
![screenshot-loadtest#2](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/locust_localhost.png)
![screenshot-loadtest#3](https://github.com/tuanhuy33/azure-devops-project2.1/blob/main/image/chart_locust.png)

## Future Enhancements
- Creating a UI for making predictions.
- Adding test cases.
- Deploying my app with AKS.

## Demo 
Demo Video on Youtube:[Azure DevOps Project 2 Huy](https://youtu.be/FflyY6L8Gzo)https://youtu.be/FflyY6L8Gzo

