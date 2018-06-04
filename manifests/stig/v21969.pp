# This class manages V-21969
# Access to Windows Online Troubleshooting Service (WOTS) must be prevented.
class secure_windows::stig::v21969 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21969':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy',
      value => 'EnableQueryRemoteServer',
      type  => 'dword',
      data  => '0',
    }

  }

}
