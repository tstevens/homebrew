require 'formula'

class Libiconv <Formula
  url 'http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz'
  homepage 'http://www.gnu.org/software/libiconv/'
  md5 '7ab33ebd26687c744a37264a330bbe9a'

  def install
    # Libiconv that comes with 10.6 has bugs when building 64bit.
    # Using our own libiconv solves this issue
    
    ENV.gcc_4_2
    
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
