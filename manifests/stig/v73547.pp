# V-73547
# The default AutoRun behavior must be configured to prevent AutoRun commands.
class secure_windows::stig::v73547 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73547':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
      value => 'NoAutorun',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
