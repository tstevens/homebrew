require 'formula'

class Dsniff <Formula
  url 'http://monkey.org/~dugsong/dsniff/beta/dsniff-2.4b1.tar.gz'
  homepage 'http://monkey.org/~dugsong/dsniff/'
  md5 ''
  
  depends_on 'libnet'
  depends_on 'libnids'

  def patches
    patches = [
      "patch-webspy.c.diff",
      "patch-webmitm.c.diff",
      "patch-urlsnarf.c.diff",
      "patch-trigger.h.diff",
      "patch-trigger.c.diff",
      "patch-tcpnice.c.diff",
      "patch-tcpkill.c.diff",
      "patch-tcp_raw.h.diff",
      "patch-tcp_raw.c.diff",
      "patch-sshmitm.c.diff",
      "patch-record.c.diff",
      "patch-macof.c.diff",
      "patch-filesnarf.c.diff",
      "patch-dnsspoof.c.diff",
      "patch-arpspoof.c.diff",
      "patch-sshow.c.diff",
      "patch-sshcrypto.c",
      "patch-pcaputil.c"
    ].collect! {|middle| "http://trac.macports.org/browser/trunk/dports/net/dsniff-devel/files/#{middle}?format=txt"}
    {:p0 => patches}
  end

  def install    
    ENV.gcc_4_2
    ENV.deparallelize
    ENV.append 'CFLAGS', "-DBIND_8_COMPAT"
    
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-libnet=#{HOMEBREW_PREFIX}", "--with-libnids=#{HOMEBREW_PREFIX}"
    system "make"
    system "make install"
  end
end
