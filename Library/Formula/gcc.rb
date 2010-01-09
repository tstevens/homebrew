require 'formula'

class Gcc <Formula
  url 'ftp://ftp.gnu.org/gnu/gcc/gcc-4.4.2/gcc-4.4.2.tar.bz2'
  homepage 'gcc.gnu.org/'
  md5 '70f5ac588a79e3c9901d5b34f58d896d'
  
  depends_on 'gmp'
  depends_on 'mpfr'
  depends_on 'libiconv'
  aka 'gfortran'
  aka 'g++'
  
  def patches
    # Corrects config.guess incorrectly choosing 32 bit builds on 64 bit capable hardware.
    {:p0 => DATA}
  end
  
  def install
    # Only builds when preset ENV variables are removed.
    # Let gcc configure
    ENV.delete('MAKEFLAGS')
    ENV.delete('CFLAGS')
    ENV.delete('LDFLAGS')
    ENV.delete('CPPFLAGS')
    ENV.delete('CXXFLAGS')
    ENV.delete('LDFLAGS')
    ENV.delete('CXX')
    ENV.delete('LD')
    ENV.delete('CC')
    
    # Configure will choose gcc (gcc-4.2)
    # Enable Optimization -O3 without build problems
    ENV.O3
    
    # Dependent lib paths
    iconv = Formula.factory 'libiconv'
    gmp = Formula.factory 'gmp'
    mpfr = Formula.factory 'mpfr'
    
    args = ["--prefix=#{prefix}", "--with-libiconv-prefix=#{iconv.prefix}", "--with-gmp=#{gmp.prefix}", "--with-mpfr=#{mpfr.prefix}",
            "--enable-languages=c,c++,fortran"]
    
    # Optimize configure flags for certain chipsets. Allow configure to use defaults for others.
    if MACOS_VERSION >= 10.6 and Hardware.is_64_bit?
      @arch = Hardware.intel_family
      if @arch == :core2 or @arch == :penryn
        args << "--with-tune=core2"
      end
    end
    
    system "./configure", *args
    system "make"
    system "make install"
  end
end

__END__
--- config.guess.orig	2010-01-02 20:51:35.000000000 -0500
+++ config.guess	2010-01-02 20:52:19.000000000 -0500
@@ -1259,6 +1259,10 @@ EOF
     *:Darwin:*:*)
 	UNAME_PROCESSOR=`uname -p` || UNAME_PROCESSOR=unknown
 	case $UNAME_PROCESSOR in
+	    i386) eval $set_cc_for_build
+	          if $CC_FOR_BUILD -E -dM -x c /dev/null | grep __LP64__>/dev/null 2>&1 ; then
+	            UNAME_PROCESSOR=x86_64
+	          fi ;;
 	    unknown) UNAME_PROCESSOR=powerpc ;;
 	esac
 	echo ${UNAME_PROCESSOR}-apple-darwin${UNAME_RELEASE}
--- libgcc/Makefile.in.orig	2010-01-02 22:04:08.000000000 -0500
+++ libgcc/Makefile.in	2010-01-02 22:04:41.000000000 -0500
@@ -31,7 +31,7 @@ prefix = @prefix@
 
 exec_prefix = @exec_prefix@
 libdir = @libdir@
-shlib_slibdir = @slibdir@
+shlib_slibdir = $(libdir)/gcc/$(host_noncanonical)/$(version)
 
 SHELL = @SHELL@
 
