# ------------------------------------------------------------------------------
# clear-theme-customisations.sh
# ------------------------------------------------------------------------------

# This script clears theme customisations that are stored as posts and in doing
# so reverts the theme to the theme files, which are version controlled.

# Patterns
wp post list --post_type=wp_block --format=ids                                 \
    | xargs --no-run-if-empty wp post delete --force

# Templates
wp post list --post_type=wp_template --format=ids                              \
    | xargs --no-run-if-empty wp post delete --force

# Template parts
wp post list --post_type=wp_template_part --format=ids                         \
    | xargs --no-run-if-empty wp post delete --force

# The global theme.json styles
wp post list --post_type=wp_global_styles --format=ids                         \
    | xargs --no-run-if-empty wp post delete --force
