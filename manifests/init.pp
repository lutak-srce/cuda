# Class: cude
#
# Module for installing NVIDIA CUDA
#
class cuda (
  $version55 = true,
  $version7 = true,
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
}
