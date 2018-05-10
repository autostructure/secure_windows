#This class manages V-1102
#Unauthorized accounts must not have the Act as part of the operating system user right.
class secure_windows::stig::v1102 (
  Boolean $enforced = true,
) {
  if $enforced {
    local_security_policy { 'Act as part of the operating system':
      ensure         => 'absent',
    }
}
}
