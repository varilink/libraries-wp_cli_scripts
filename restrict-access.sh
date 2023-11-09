# ------------------------------------------------------------------------------
# restrict-access.sh
# ------------------------------------------------------------------------------

# This script restricts access to sites using the restricted-site-access plugin.
# I do this typically for test instances of websites that are exposed externally
# for clients.

set -e

wp plugin install --activate restricted-site-access

# Setup IP addresses that are exempted from the access restriction in an
# idempotent manner. These are the Varilink office network and the list of IP
# addresses that PayPal publish, as these could be the source of webhook
# requests; see:
# https://www.paypal.com/uk/cshelp/article/what-are-the-ip-addresses-for-live-paypal-servers-ts1056

wp rsa ip-remove 192.168.1.0/24
wp rsa ip-remove 64.4.240.0/21
wp rsa ip-remove 64.4.240.0/22
wp rsa ip-remove 66.211.168.0/22
wp rsa ip-remove 91.243.72.0/23
wp rsa ip-remove 173.0.80.0/20
wp rsa ip-remove 185.177.52.0/22
wp rsa ip-remove 192.160.215.0/24
wp rsa ip-remove 198.54.216.0/23

wp rsa ip-add 192.168.1.0/24
wp rsa ip-add 64.4.240.0/21
wp rsa ip-add 64.4.240.0/22
wp rsa ip-add 66.211.168.0/22
wp rsa ip-add 91.243.72.0/23
wp rsa ip-add 173.0.80.0/20
wp rsa ip-add 185.177.52.0/22
wp rsa ip-add 192.160.215.0/24
wp rsa ip-add 198.54.216.0/23

wp rsa ip-update 192.168.1.0/24 --new-label=varilink
wp rsa ip-update 64.4.240.0/21 --new-label=paypal-1
wp rsa ip-update 64.4.240.0/22 --new-label=paypal-2
wp rsa ip-update 66.211.168.0/22 --new-label=paypal-3
wp rsa ip-update 91.243.72.0/23 --new-label=paypal-4
wp rsa ip-update 173.0.80.0/20 --new-label=paypal-5
wp rsa ip-update 185.177.52.0/22 --new-label=paypal-6
wp rsa ip-update 192.160.215.0/24 --new-label=paypal-7
wp rsa ip-update 198.54.216.0/23 --new-label=paypal-8
