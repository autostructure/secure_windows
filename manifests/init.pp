#
# This module secures windows
#
class secure_windows {

  include secure_windows::auditpol

  notify { 'test message': }

}
