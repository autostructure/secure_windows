# This class manages V-21980
# Explorer Data Execution Prevention must be enabled.
class secure_windows::stig::v21980 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer\NoDataExecutionPrevention':
      ensure => present,
      type   => 'dword',
      data   => '0',
    }
  }
}
