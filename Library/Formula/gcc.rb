require 'formula'

class Gcc <Formula
  url 'ftp://ftp.gnu.org/gnu/gcc/gcc-4.5.0/gcc-4.5.0.tar.bz2'
  homepage 'http://gcc.gnu.org/'
  md5 'ff27b7c4a5d5060c8a8543a44abca31f'

  depends_on 'gmp'
  depends_on 'mpfr'
  depends_on 'libmpc' #mpc
  aka 'gfortran'
  aka 'g++'
  
  def install
    
    ENV.delete('MAKEFLAGS')
    ENV.delete('CFLAGS')
    ENV.delete('LDFLAGS')
    ENV.delete('CPPFLAGS')
    ENV.delete('CXXFLAGS')
    ENV.delete('LDFLAGS')
    ENV.delete('CXX')
    ENV.delete('LD')
    ENV.delete('CC')
    
    ENV.O3
    
    gmp = Formula.factory 'gmp'
    mpfr = Formula.factory 'mpfr'
    
    args = ["--prefix=#{prefix}", "--with-gmp=#{gmp.prefix}", "--with-mpfr=#{mpfr.prefix}",
            "--enable-languages=c,c++,fortran"]
    system "./configure", *args
    system "make"
    system "make install"
  end
end
