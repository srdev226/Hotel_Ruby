## Deploying

### Timing for Deploys

* Staging: Deploy after merging into `master`.
* Production: Deployed after acceptance is empty. After standup is a great time to do this.

NOTE: Try to avoid deploying late in the day or on Fridays.

### Deploying to Staging

**NOTE: We do not currently have a staging server set up.**

`./bin/deploy staging`

### Deploying to Production

`./bin/deploy production`
