require 'formula'

class Gmock <Formula
  url 'http://googlemock.googlecode.com/files/gmock-1.4.0.tar.bz2'
  homepage ''
  md5 'b99ff7d396579de974a70e9468800173'


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make install"
  end
end
