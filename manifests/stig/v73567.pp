# V-73567
# Passwords must not be saved in the Remote Desktop Client.
class secure_windows::stig::v73567 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73567':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'DisablePasswordSaving',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
