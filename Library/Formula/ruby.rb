require 'formula'

# TODO de-version the include and lib directories

class Ruby <Formula
  @url='http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz'
  @homepage='http://www.ruby-lang.org/en/'
  @md5='9fc5941bda150ac0a33b299e1e53654c'

  depends_on 'readline'
  depends_on 'libiconv'
  
  def patches
    # Fixes config.guess not selcting x86_64 when running a 64 bit capable processor.
    {:p0 => DATA}
  end
  
  def options
    [
      ["--with-suffix", "Add a 19 suffix to commands"],
    ]
  end
  
  def install
    ENV.gcc_4_2
    
    # Libiconv that comes with 10.6 has bugs when building 64bit.
    # Using our own libiconv solves this issue
    iconv = Formula.factory 'libiconv'

    args = [ "--prefix=#{prefix}",
            "--disable-debug",
            "--disable-dependency-tracking",
            "--enable-shared",
            "--with-iconv-dir=#{iconv.prefix}" ]

    args << "--program-suffix=19" if ARGV.include? "--with-suffix"

    system "./configure", *args
    system "make"
    system "make install"
  end
  
  def caveats; <<-EOS
If you install gems with the RubyGems installed with this formula they will
be installed to this formula's prefix. This needs to be fixed, as for example,
upgrading Ruby will lose all your gems.
    EOS
  end
  
  def skip_clean? path
    # TODO only skip the clean for the files that need it, we didn't get a
    # comment about why we're skipping the clean, so you'll need to figure
    # that out first --mxcl
    true
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
