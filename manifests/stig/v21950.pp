#This class manages V-21950
#The service principal name (SPN) target name validation level must be turned off.
class secure_windows::stig::v21950 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v21950':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters',
      value => 'SmbServerNameHardeningLevel',
      type  => 'dword',
      data  => '0',
    }

  }
}
