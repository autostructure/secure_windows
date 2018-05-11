#This class manages V-14247
#Passwords must not be saved in the Remote Desktop Client.
class secure_windows::stig::v14247 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14247':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'DisablePasswordSaving',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
