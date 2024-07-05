### CI
CI is handled by Jenkins Pipelines. ```main``` and ```develop``` are protected and Jenkins Pipeline must succeed before merging.

```main``` and  ```develop``` require status checks to be merged
- At the moment the only status check is ```continuous-integration/jenkins/pr-head``` which is set by Jenkins
- Additionally more rules can be added, for example n number of reviews.

### Environment variables
List on env variables used in code (NAME,default value):
* OPTION_A, "Cats"
* OPTION_B, "Dogs"
* VOTE_VERSION, "v1"
* PORT, 80
* REDIS_HOST, "redis"