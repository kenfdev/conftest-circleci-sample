package main

deny[msg] {
 input.version < 2.1
 msg = "Use version 2.1 or higher"
}

deny[msg] {
  docker_images := input.jobs[_].docker[_].image
  startswith(docker_images, "circleci/")
  msg = "Only use official CircleCI images"
}

deny[msg] {
  images := input.jobs[_].docker[_].image
  tag_is_latest(split(images, ":"))
  msg = "Do not use `latest` container image tags"
}

deny[msg] {
  count(input.workflows) > 0
  msg = "Do not use workflows"
}

# helpers
tag_is_latest(images) {
  count(images) < 2
}

tag_is_latest([_, tag]) {
  tag == "latest"
}