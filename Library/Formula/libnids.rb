require 'formula'

class Libnids <Formula
  url 'http://prdownloads.sourceforge.net/libnids/libnids-1.23.tar.gz?download'
  homepage 'http://libnids.sourceforge.net/'
  md5 'af35e8ef403a0ca95df2da94db856428'
  version '1.23'
  
  depends_on 'libnet'
  depends_on 'glib'

  def install
    ENV.gcc_4_2
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-libglib"
    system "make install"
  end
end
