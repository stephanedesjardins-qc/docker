#!/bin/bash

set -e

if [[ "${CIRCLE_BRANCH}" == "master" ]]; then
  docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

  docker push decidim/decidim:latest-deploy
  docker push decidim/decidim:latest-dev
  docker push decidim/decidim:latest-test
  docker push decidim/decidim:latest
fi

if [[ "${CIRCLE_BRANCH}" =~ ^[0-9\.]+$ ]]; then
  docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

  docker push "decidim/decidim:${CIRCLE_BRANCH}-deploy"
  docker push "decidim/decidim:${CIRCLE_BRANCH}-dev"
  docker push "decidim/decidim:${CIRCLE_BRANCH}-test"
  docker push "decidim/decidim:${CIRCLE_BRANCH}"
fi
