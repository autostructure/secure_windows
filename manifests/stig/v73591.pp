# V-73591
# PowerShell script block logging must be enabled.
class secure_windows::stig::v73591 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73591':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging',
      value => 'EnableScriptBlockLogging',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
