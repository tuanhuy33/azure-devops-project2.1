#!/usr/bin/env bash

locust -f locustfile.py --host https://azure-devops-project2-huy.azurewebsites.net/ --users 500 --spawn-rate 5 
