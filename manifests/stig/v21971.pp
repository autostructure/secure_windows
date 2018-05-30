# This class manages V-21971
# The Application Compatibility Program Inventory must be prevented from collecting data and sending the information to Microsoft.
class secure_windows::stig::v21971 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21971':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppCompat',
      value => 'DisableInventory',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
