require 'formula'

class Sparsehash <Formula
  url 'http://google-sparsehash.googlecode.com/files/sparsehash-1.6.tar.gz'
  homepage 'http://code.google.com/p/google-sparsehash/'
  md5 '054fc9626730cd866ea15fe26b9462c6'


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
