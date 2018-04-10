# V-73543
# The Application Compatibility Program Inventory must be prevented from collecting data and sending the information to Microsoft.
class secure_windows::stig::v73543 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73543':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat',
      value => 'DisableInventory',
      type  => 'dword',
      data  => '0x00000001',
    }

}
