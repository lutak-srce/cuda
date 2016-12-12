# Class: cude
#
# Module for installing NVIDIA CUDA
#
class cuda (
  $version55 = true,
  $version7 = true,
  $version8 = true,
) {
  require yum::repo::cuda

  if $version55 {
    package { 'cuda-extra-libs-5-5':
      ensure  => present,
    }
    package { 'cuda-core-5-5':
      ensure  => present,
    }
    file { '/etc/modulefiles/cuda-5-5':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/cuda/cuda-5-5',
    }
  } 
  if $version7 {
    package { 'cuda-core-7-0':
      ensure  => present,
    }
    package { 'cuda-runtime-7-0':
      ensure  => present,
    }
    # dev packages
    package { [ 'cuda-cudart-dev-7-0', 'cuda-cublas-dev-7-0', 'cuda-cufft-dev-7-0', 'cuda-curand-dev-7-0', 'cuda-cusolver-dev-7-0', 'cuda-cusparse-dev-7-0', 'cuda-npp-dev-7-0', 'cuda-nvrtc-dev-7-0' ]:
      ensure  => present,
    }
    file { '/etc/modulefiles/cuda-7-0':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/cuda/cuda-7-0',
    }
  }
  if $version8 {
    package { 'cuda-core-8-0':
      ensure  => present,
    }
    package { 'cuda-runtime-8-0':
      ensure  => present,
    }
    # dev packages
    package { [ 'cuda-cudart-dev-8-0', 'cuda-cublas-dev-8-0', 'cuda-cufft-dev-8-0', 'cuda-curand-dev-8-0', 'cuda-cusolver-dev-8-0', 'cuda-cusparse-dev-8-0', 'cuda-npp-dev-8-0', 'cuda-nvrtc-dev-8-0' ]:
      ensure  => present,
    }
    file { '/etc/modulefiles/cuda-8-0':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/cuda/cuda-8-0',
    }
  }
}
