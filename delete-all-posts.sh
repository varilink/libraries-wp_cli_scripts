# ------------------------------------------------------------------------------
# delete-all-posts.sh
# ------------------------------------------------------------------------------

# This script deletes all the posts of a specified type. Note that we use the
# --force flag since some post types cannot be soft deleted to the trash bin.

wp post list --format=ids --post_type=$1                                       \
  | xargs --no-run-if-empty wp post delete --force
