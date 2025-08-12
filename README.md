# squid-docker

Docker image for squid based on the current alpine version.

[<img src="https://concourse.emjot.de/api/v1/teams/emjot/pipelines/squid-docker/jobs/build-and-publish/badge">](https://concourse.emjot.de/teams/emjot/pipelines/squid-docker)

Images are published to https://hub.docker.com/repository/docker/emjotde/squid.


## Tags

A new image is published automatically and regularly to ensure OS packages are up to date.

Rolling Tags:
- `latest`: points to the latest image pushed
- `SQUID_MAJOR_VERSION-alpineALPINE_MAJOR_AND_MINOR` (e.g. `6-alpine3.22`)

Static Tag:
- `SQUID_MAJOR_VERSION-alpineALPINE_MAJOR_AND_MINOR-YYYYmmdd` (e.g. `6-alpine3.22-20250812`) This tag includes the date it was published. If you want to stay on a specific version of squid then sticking to a particular build will meet your needs.

At the moment, we only build for a single alpine version (3.22 as of August 2025). That means when 3.23 is out, we plan to switch to 3.23 and discontinue building/updating images for the older version. If there is a need to support multiple alpine versions, get in touch by creating an issue (and possibly be prepared to create a PR ;-).
