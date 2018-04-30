# V-73517
# Virtualization-based protection of code integrity must be enabled on domain-joined systems.
class secure_windows::stig::v73517 (
  Boolean $enforced = false,
  Enum['lock','no lock'] $hypervisorenforcedcodeintegrity = 'lock',
) {

  if $enforced {
    if($facts['windows_type'] =~ /(1|3|4|5)/) {
      $hypervisorenforcedcodeintegrityval = $hypervisorenforcedcodeintegrity ? {
        'lock'    => '0x00000001',
        'no lock' => '0x00000002',
      }

      registry::value { 'v73517':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
        value => 'HypervisorEnforcedCodeIntegrity',
        type  => 'dword',
        data  => $hypervisorenforcedcodeintegrityval,
      }
    }

  }

}
