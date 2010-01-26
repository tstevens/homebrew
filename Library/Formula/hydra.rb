require 'formula'

class Hydra <Formula
  url 'http://freeworld.thc.org/releases/hydra-5.4-src.tar.gz'
  homepage ''
  md5 'fa08b465d19321e77b1a0ef912eeecc1'


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-xhydra"
    system "make"
    bin.install %w[hydra pw-inspector]
  end
end