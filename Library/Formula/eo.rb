require 'formula'

class Eo <Formula
  url 'http://downloads.sourceforge.net/project/eodev/eo/1.0.1/eo-1.0.1.zip'
  homepage ''
  md5 'eab26f20d978175ef99b0504579165a2'
  version '1.0.1'


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make install"
  end
end
