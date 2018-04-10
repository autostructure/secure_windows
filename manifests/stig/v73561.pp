# V-73561
# Explorer Data Execution Prevention must be enabled.
class secure_windows::stig::v73561 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73561':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
      value => 'NoDataExecutionPrevention',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
