require 'formula'

class Zchaff64bit <Formula
  url 'http://www.princeton.edu/~chaff/zchaff/zchaff.64bit.2007.3.12.zip'
  homepage 'http://www.princeton.edu/~chaff/zchaff.html'
  md5 'c519a6644e73b430c06dd6af4abe41d8'


  def install
    ENV.deparallelize
    system "make all"
    bin.install %w[zchaff cnf_stats zminimal zverify_df]
  end
end
