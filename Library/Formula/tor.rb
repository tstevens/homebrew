require 'formula'

class Tor <Formula
  url 'https://www.torproject.org/dist/tor-0.2.1.24.tar.gz'
  homepage 'https://www.torproject.org/'
  md5 '583501a989ed0c39e209b604c3671ecd'
  
  depends_on 'libevent'
  
  
  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
