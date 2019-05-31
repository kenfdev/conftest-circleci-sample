## Sample conftest against CircleCI config

A simple sample against CircleCI's config with [conftest](https://github.com/instrumenta/conftest)


## Try it

```
$ cd .circleci
$ conftest test config.yml
config.yml
   Only use official CircleCI images
   Do not use `latest` container image tags
   Use version 2.1 or higher
```