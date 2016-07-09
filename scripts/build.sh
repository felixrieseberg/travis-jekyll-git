#!/bin/bash

jekyll build --config _config_ci.yml
htmlproofer ./_site --url-ignore www.youtube.com
