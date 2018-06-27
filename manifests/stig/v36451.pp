# This class manages V-36451
# Administrative accounts must not be used with applications that access the Internet, such as web browsers,
# or with potential Internet sources, such as email.
class secure_windows::stig::v36451 (
  Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_windows::applocker_startup

    applocker_rule { '(STIG Rule) V-73225 - Disable IE for Administrators':
      ensure            => 'present',
      action            => 'Deny',
      conditions        => [
      {
        'publisher'  => 'O=MICROSOFT CORPORATION, L=REDMOND, S=WASHINGTON, C=US',
        'product'    => 'INTERNET EXPLORER',
        'binaryname' => '*',
        'hi_version' => '*',
        'lo_version' => '11.0.0.0'
      }],
      description       => 'STIG Rule addressing vulnerability V-73225: Administrative accounts must not be used with applications that access the Internet, such as web browsers, or with potential Internet sources, such as email.', # lint:ignore:140chars
      mode              => 'NotConfigured',
      rule_type         => 'publisher',
      type              => 'Exe',
      user_or_group_sid => 'S-1-5-32-544',
    }
  }
}
