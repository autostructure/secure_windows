# This class manages the servicing level requirement
class secure_windows::servicing_level {
  if($facts['kernelversion'] >= 10.0.14393) {
    notify { 'message':
      message => 'hello',
    }
  }
}
