# This class manage V-4445
# Optional Subsystems must not be permitted to operate on the system.
class secure_windows::stig::v4445 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v4445':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Subsystems',
      value => 'Optional',
      type  => 'array',
      data  => [],
    }
  }
}
