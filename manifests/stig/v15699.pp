# This class manages V-15699
# Windows Connect Now provides wizards for tasks such as "Set up a wireless router or access point" and must not be available to users.
class secure_windows::stig::v15699 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15699':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\UI',
      value => 'DisableWcnUi',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
