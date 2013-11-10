## Scripts for Deb Packages


This repository contains scripts that compile software and package them to DEB-packages.

## Usage

    git clone https://github.com/devopsbox/ubuntu-custom-packages.git
    cd ubuntu-custom-packages
    vagrant up build-box
    vagrant ssh build-box

## Building Packages

    ./ubuntu-12.04/openresty/*.sh
    ./ubuntu-12.04/redis/*.sh
    ./ubuntu-12.04/ruby-2.0.0/*.sh
    ./ubuntu-12.04/tinc/*.sh
    ./ubuntu-12.04/varnish/*.sh

## Upload Files

    $ sh/upload-pkg

## Ubuntu 12.04
  - Ruby 2.0.0
  - Varnish 3.0.4
  - OpenResty (Nginx + Lua)
  - Redis
  - Tinc VPN

## Resulting files can be found here:
  - https://sourceforge.net/projects/mindreframerpackages/files/?source=navbar

## Installation Requirements

    $ apt-get install gdebi-core


## Install Tinc

    wget http://master.dl.sourceforge.net/project/mindreframerpackages/tinc-1.0.23.ubuntu.12.04_amd64.deb
    gdebi -n tinc-1.0.23.ubuntu.12.04_amd64.deb

## Install Ruby 2.0

    wget http://master.dl.sourceforge.net/project/mindreframerpackages/ruby-2.0.0-p247.ubuntu.12.04_amd64.deb
    gdebi -n ruby-2.0.0-p247.ubuntu.12.04_amd64.deb

## Install Varnish 3

    wget http://master.dl.sourceforge.net/project/mindreframerpackages/varnish-3.0.4.ubuntu.12.04_amd64.deb
    gdebi -n varnish-3.0.4.ubuntu.12.04_amd64.deb

## Install Redis
    wget http://master.dl.sourceforge.net/project/mindreframerpackages/redis-2.8.0-rc6.ubuntu.12.04_amd64.deb
    gdebi -n redis-2.8.0-rc6.ubuntu.12.04_amd64.deb

## Install Nginx

    # 1.2.8
    wget http://master.dl.sourceforge.net/project/mindreframerpackages/nginx_1.2.8-2.ubuntu.12.04_amd64.deb
    gdebi -n nginx_1.2.8-2.ubuntu.12.04_amd64.deb

    # 1.4.3
    wget http://master.dl.sourceforge.net/project/mindreframerpackages/nginx_1.4.3.1-1.ubuntu.12.04_amd64.deb
    gdebi -n nginx_1.4.3.1-1.ubuntu.12.04_amd64.deb

