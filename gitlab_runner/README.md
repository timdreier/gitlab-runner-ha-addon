# Home Assistant Add-on: GitLab Runner

A GitLab Runner is an executable service used by GitLab to perform CI/CD (Continuous Integration/Continuous Deployment) tasks. This addon enables your Home Assistant instance to act as gitlab runner.

## Installation

Add the addon repository to your Home Assistant by clicking the button below or manually adding this repository in the addon section of your Home Assistant instance.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftimdreier%2Fgitlab-runner-ha-addon)

Afterwards you should be able to install the addon from your addon store.

After installation disable "Protection mode" in the "Info" section of the addon settings to expose the docker socket to the addon.

## Configuration

Currently, the addon supports the docker executor from GitLab runner. Before your start the addon the first time you have to set at least the runner token (get token for [shared](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#create-a-shared-runner-with-a-runner-authentication-token), [group](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#create-a-group-runner-with-a-runner-authentication-token), or [project](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#create-a-project-runner-with-a-runner-authentication-token) runner).

### Options

| option         | default               | description                        |
| -------------- | --------------------- | ---------------------------------- |
| `url`          | `https://gitlab.com/` | url of your gitlab instance        |
| `token`        | `null`                | gitlab runner authentication token |
| `docker_image` | `alpine:latest`       | default docker image to use        |

### Advanced configuration

The file `/etc/gitlab-runner/config.toml` is mounted to `/addon_configs/local_gitlab_runner/config.toml`. You can adapt the file for your needs there.

> ⚠️ Important: restart the addon after changing it's config
