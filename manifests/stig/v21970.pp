# This class manages V-21970
# Responsiveness events must be prevented from being aggregated and sent to Microsoft.
class secure_windows::stig::v21970 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21970':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}',
      value => 'ScenarioExecutionEnabled',
      type  => 'dword',
      data  => '0',
    }

  }

}
