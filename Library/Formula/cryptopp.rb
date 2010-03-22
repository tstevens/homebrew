require 'formula'

class Cryptopp <Formula
  url 'http://prdownloads.sourceforge.net/cryptopp/cryptopp560.zip'
  homepage 'http://www.cryptopp.com/'
  md5 '36f35789ad60489d58003d3c849807e8'

  aka 'crypto++'

  def install
    inreplace "GNUmakefile" do |s|
      s.remove_make_var! ["CXX", "CXXFLAGS"]
    end
    system "make libcryptopp.a"

    # Install this ourselves
    (include+"cryptopp").install Dir['*.h']
    lib.install "libcryptopp.a"
    
    # some sources look for crypto++ instead of cryptopp
    FileUtils.ln_s include+"cryptopp", include+"crypto++"    
    FileUtils.ln_s lib+"libcryptopp.a", lib+"libcrypto++.a"    
  end
end
