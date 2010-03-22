require 'formula'

class Beagle <Formula
  url 'http://cdnetworks-us-1.dl.sourceforge.net/project/beagle/beagle/3.0.3/beagle-3.0.3.tar.gz'
  homepage ''
  md5 'de928be9857e522e9180f5f6a190377e'


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--enable-optimization"
    system "make install"
  end
end
