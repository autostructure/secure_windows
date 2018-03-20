#
# This module secures windows
#
# TODO:
# - LGPO
# - REGISTRY
# - GPO
# - OTHER
#
class secure_windows {

  #include ::secure_windows::acl
  #include ::secure_windows::ad_acl
  include ::secure_windows::auditpol
  #include ::secure_windows::features
  include ::secure_windows::registry_editor
  include ::secure_windows::lgpo

  Class['::secure_windows::registry_editor']
  -> Class['::secure_windows::lgpo']

}
