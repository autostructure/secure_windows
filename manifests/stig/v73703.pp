# V-73703
# Windows Server 2016 must be configured to require case insensitivity for non-Windows subsystems.
class secure_windows::stig::v73703 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73703':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel',
      value => 'ObCaseInsensitive',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
