require 'formula'

class Libserial <Formula
  url 'http://downloads.sourceforge.net/libserial/libserial-0.6.0rc1.tar.gz'
  homepage 'http://libserial.sourceforge.net/'
  md5 'c5966eb71ba2bbbf9af1d6dfdfc70a30'
  
  depends_on 'sip'
  
  def patches
    {:p0 => DATA}
  end
  

  def install
    ENV.gcc_4_2
    
    # Required path for python 
    ENV['PYTHONPATH']='/usr/local/lib/python'
    
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make install"
    
  end
end

__END__
--- sip/SerialPort.sip.orig	2008-11-11 20:27:30.000000000 -0500
+++ sip/SerialPort.sip	2010-02-12 20:47:55.000000000 -0500
@@ -24,7 +24,6 @@
         BAUD_57600   = B57600,
         BAUD_115200  = B115200,
         BAUD_230400  = B230400,
-        BAUD_460800  = B460800,
         BAUD_DEFAULT = BAUD_57600
     } ;
 
