#!/bin/bash

jekyll build --config _config_ci.yml
htmlproof ./_site --href-ignore "#,/https:\/\/www\.youtube\.com\/.*/,/http:\/\/www\.youtube\.com\/.*/"
