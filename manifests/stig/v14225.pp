# This class manages V-14225
# Windows 2012/2012 R2 password for the built-in Administrator account must be changed at least annually or when a member
# of the administrative team leaves the organization.

class secure_windows::stig::v14225 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['password_lastset'] == 0 {
      exec { 'Reset the Password':
        command => "net user jack /logonpasswordchg:yes",
<<<<<<< HEAD
        path    => 'C:\windows\system32'
=======
>>>>>>> cd1594ced472b8163d4985649ac7b8b7649d03af
      }
    }
  }
}
