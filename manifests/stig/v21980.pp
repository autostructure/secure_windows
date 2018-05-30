# This class manages V-21980
# Explorer Data Execution Prevention must be enabled.
class secure_windows::stig::v21980 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21980':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
      value => 'NoDataExecutionPrevention',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
