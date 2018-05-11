# This class manages V-3385
# The system must be configured to require case insensitivity for non-Windows subsystems.
class secure_windows::stig::v3385 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3385':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel',
      value => 'ObCaseInsensitive',
      type  => 'dword',
      data  => '1',
    }
  }
}
