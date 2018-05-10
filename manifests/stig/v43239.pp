# This class manages V-43239
# Windows 2012 R2 must include command line data in process creation events.
class secure_windows::stig::v43239 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['operatingsystemmajrelease'] == '2012 R2' {
      registry::value { 'v43239':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit',
        value => 'ProcessCreationIncludeCmdLine_Enabled',
        type  => 'dword',
        data  => '0x00000001',
      }
    }
  }
}
