#
# This module secures windows
#
# TODO:
# - REGISTRY
# - GPO
# - OTHER
#
class secure_windows {

  include secure_windows::auditpol
  include secure_windows::lgpo

}
