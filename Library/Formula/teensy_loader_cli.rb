require 'formula'

class TeensyLoaderCli <Formula
  url 'http://www.pjrc.com/teensy/teensy_loader_cli.2.0.tar.gz'
  homepage 'http://www.pjrc.com/teensy/loader_cli.html'
  md5 '29376dce1b37826c91839a53cff75dc0'


  def install
    inreplace "Makefile", "OS ?= LINUX", "#OS ?= LINUX"
    inreplace "Makefile", "#OS ?= MACOSX", "OS ?= MACOSX"
    inreplace "Makefile", "SDK ?= /Developer/SDKs/MacOSX10.5.sdk", "SDK ?= /Developer/SDKs/MacOSX10.6.sdk" if MACOS_VERSION >= 10.6
    system "make"
    bin.install 'teensy_loader_cli'
  end
end
