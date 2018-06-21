# This class manages V-14225
# Windows 2012/2012 R2 password for the built-in Administrator account must be changed at least annually or when a member
# of the administrative team leaves the organization.

class secure_windows::stig::v14225 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['password_lastset'] > 365 {
      exec { 'Reset the Password':
        command => "net user adminaccount /logonpasswordchg:yes",
        path    => 'C:\windows\system32',
      }
    }
  }
}
