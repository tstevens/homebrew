require 'formula'

class Libmpc <Formula
  url 'http://www.multiprecision.org/mpc/download/mpc-0.8.1.tar.gz'
  homepage 'http://www.multiprecision.org/'
  md5 '5b34aa804d514cc295414a963aedb6bf'
  
# aka 'mpc'
  depends_on 'gmp'
  depends_on 'mpfr'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
    system "make check"
  end
end
