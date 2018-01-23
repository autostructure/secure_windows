#
# Test specific resources
#
class secure_windows::test {
  local_security_policy { 'Act as part of the operating system':
    ensure         => 'absent',
  }
}
