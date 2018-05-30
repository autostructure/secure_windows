# This class manages V-21967
# Microsoft Support Diagnostic Tool (MSDT) interactive communication with Microsoft must be prevented.
class secure_windows::stig::v21967 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21967':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy',
      value => 'DisableQueryRemoteServer',
      type  => 'dword',
      data  => '0',
    }

  }

}
