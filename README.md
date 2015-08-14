## Deploy Jekyll pages using Git and Travis CI

GitHub Pages are an amazing way to host Jekyll pages, but in some cases, you might be interested in running your Jekyll page on a different host (like Azure Web Apps, Heroku, AWS). Since the magic of Jekyll is that it generates static websites, I did not want to run a full Ruby server. Instead, I'm using Travis CI to setup a devops build pipeline, taking new commits, testing the page, and deploying it. Here's the workflow:

 * Create a new commit, triggering Travis CI
 * Install Ruby, Jekyll, HTMLProofer, and all dependencies
 * Compile the page
 * Test that all images and links work (using HTMLProofer)
 * If the test passed, enter the generated `_site` directory and create a new empty Git repository
 * Add and commit all static files
 * Force-push the result to a desired remote Git repo, suppressing any potentially compromising log messages

The files of interest here are `.travis.yml`, `_config_ci.yml`, `scripts/build.sh` and `scripts/deploy.sh`. The Travis configuration file instructs Travis, to build, test, and deploy using `_config_ci.yml` as Jekyll configuration and `scripts/deploy.sh` as the custom deployment provider.

To use this for your own project, update `.travis.yml` with your own white- and blacklisted branches. Then, check `build.sh` and ensure that the settings for `jekyll build` and HTMLProofer are fit for your site (in most cases, they should be). Finally, go to your Travis Profile to edit the settings for your source repository. In there, add three environment variables:

* `git_user` Git username
* `git_password` Git password
* `git_target` Git target repository url (without `https://`)

Include the four files in this repo in your source repo - and you're good to go!

## License
MIT, please see LICENSE for details. 