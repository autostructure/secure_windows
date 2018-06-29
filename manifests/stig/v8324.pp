# This class manages V-8324
# The time synchronization tool must be configured to enable logging of time source switching.
class secure_windows::stig::v8324 (
  Boolean $enforced = true,
  Enum['2','3'] $ntp_logging_enabled = '2'
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      $ntp_logging_enabled_value = $ntp_logging_enabled ? {
        '2'    => '0x00000002',
        '3' => '0x00000003',
      }
      registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient\Enabled':
        ensure => present,
        type   => 'dword',
        data   => $ntp_logging_enabled_value,
      }

      # registry::value { 'v8324':
      #   key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient',
      #   value => 'Enabled',
      #   type  => 'dword',
      #   data  => $ntp_logging_enabled_value,
      # }
    }
  }
}
