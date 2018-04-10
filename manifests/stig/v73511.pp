# V-73511
# Command line data must be included in process creation events.
class secure_windows::stig::v73511 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73511':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit',
      value => 'ProcessCreationIncludeCmdLine_Enabled',
      type  => 'dword',
      data  => '0x00000001',
    }

}
