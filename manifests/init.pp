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

  include ::secure_windows::registry_editor
  include ::secure_windows::auditpol
  include ::secure_windows::lgpo

}
