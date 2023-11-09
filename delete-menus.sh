# ------------------------------------------------------------------------------
# delete-menus.sh
# ------------------------------------------------------------------------------

# This script deletes all the defined menus, both classic menus and block theme
# menus.

# Classic menus
wp menu list --format=ids | xargs --no-run-if-empty wp menu delete

# Block theme menus
wp post list --format=ids --post_type=wp_navigation                            \
  | xargs --no-run-if-empty wp post delete --force
