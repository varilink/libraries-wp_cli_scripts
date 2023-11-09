# Libraries - WP CLI Scripts

David Williamson @ Varilink Computing Ltd

------

A library of common WP-CLI scripts that can be shared across WordPress projects. These can be used in combination with a project's own WP-CLI scripts, if it has any. A project's own scripts will of course perform functions that are specific to that project whereas the scripts in this library perform functions that are common across projects.

My current strategy for including this library in projects is that it be made a submodule of the project's `wordpress` repository. That's because I have an idea that scripts in this library might define functions that can then be used by a project's own WP-CLI scripts. This would create a version dependency between a project's WP-CLI scripts and the functions that it uses from this shared library of WP-CLI scripts. However, I haven't as yet implemented any examples that follow that approach so I may change the strategy for including this library if it turns out that I never do.

Of course we can always run individual WP-CLI commands rather than scripts that themselves run WP-CLI commands; however there are two reasons that might motivate us to define a script instead:

 1. The script coordinates multiple WP-CLI commands, possibly in combination with other, non WP-CLI commands.
 2. When it is run via Ansible, the script relies on pre and/or post dependencies - see below.

## Contents

This repository contains the following WP-CLI scripts in its root folder:

| Script (without `.sh` extension) | Function                                                          |
| -------------------------------- | ----------------------------------------------------------------- |
| clear-theme-customisations       | Clears theme customisation thus reverting to the theme's files    |
| delete-all-posts                 | Deletes all the posts of a specified post type                    |
| delete-menus                     | Deletes all classic and block theme menus                         |
| import-wxr-file                  | Imports a WordPress WXR file                                      |
| restrict-access                  | Restrict access to a site using the restricted-site-access plugin |

The `pre` and `post` folders contain Ansible task lists that to be executed before and after the WP-CLI scripts where necessary. These are associated to the scripts by name; for example `pre/import-wxr-file.yml` contains precursor Ansible tasks for the `import-wxr-file.sh` WP-CLI script. These `pre` and `post` Ansible task lists are only applicable when the WP-CLI script itself is run using Ansible.

## Usage

This script library can be used in both Docker Compose managed, client development and test environments and Ansible managed hosts. The [Tools - WordPress](https://github.com/varilink/tools-wordpress) repository supports it via its `wp-cli` Docker Compose service and the [Libraries - Ansible Playbooks](https://github.com/varilink/libraries-ansible_playbooks)repository supports it via its `run-wp-cli-script.yml` playbook. See those repositories for generic instructions on running these WP-CLI scripts. Any script specific additional instructions follow, if there are any.
