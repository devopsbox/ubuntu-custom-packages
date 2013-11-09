

## Packaging Ruby as Deb Package

  - https://github.com/sethcall/ubuntu-ruby-package-builder/blob/master/build-deb-ruby-2.0.0-p0.sh
  - https://github.com/hemanth/futhark/blob/master/ruby-deb.sh
  - http://h3manth.com/content/packing-ruby2.0-debian
  - https://github.com/sethcall/ubuntu-ruby-package-builder
  - https://github.com/brightbox/deb-ruby1.9.1/blob/master/debian/rules#L49
  - http://ftp.ruby-lang.org/pub/ruby/


## Usage

    git clone https://github.com/devopsbox/ubuntu-custom-packages.git
    cd ubuntu-custom-packages
    ./ubuntu-12.04/ruby.2.0.0-p247.sh


## Test package installation

    apt-get install gdebi-core
    gdebi -n ruby-2.0.0-p247_amd64.deb

## Cleanup packages

    apt-get remove -y gdebi-core
    apt-get remove -y libyaml-0-2
    apt-get remove -y ruby2

