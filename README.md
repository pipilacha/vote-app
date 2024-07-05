### CI
CI is handled by Jenkins Pipelines.

```main``` and ```develop``` are protected and Jenkins Pipeline must succeed before merging.

Pull requests to these branches require status checks to be merged
- At the moment the only status check is ```continuous-integration/jenkins/pr-head``` which is set by Jenkins
- Additionally the PR requires at least one reviewer.

These pull requests will trigger Jenkins to run the Pipeline. We are only bulding on pull requests.

### Environment variables
List on env variables used in code (NAME,default value):
* OPTION_A, "Cats"
* OPTION_B, "Dogs"
* VOTE_VERSION, "v1"
* PORT, 80
* REDIS_HOST, "redis"