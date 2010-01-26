require 'formula'

class Clamav <Formula
  url 'http://freshmeat.net/urls/c9bfa0aa2a4b8f3dc21e37debf0b05e5'
  homepage 'http://www.clamav.net/'
  md5 'eaf9fccc3cc3567605a9732313652967'
  version '0.95.3'
  
  def patches
    {:p0 => DATA}
  end

# depends_on 'cmake'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end

__END__
--- config/config.guess.orig	2010-01-02 20:51:35.000000000 -0500
+++ config/config.guess	2010-01-02 20:52:19.000000000 -0500
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
--- etc/freshclam.conf.orig	2010-01-17 01:26:53.000000000 -0500
+++ etc/freshclam.conf	2010-01-17 01:31:15.000000000 -0500
@@ -4,8 +4,6 @@
 ##
 
 
-# Comment or remove the line below.
-Example
 
 # Path to the database directory.
 # WARNING: It must match clamd.conf's directive!
@@ -14,7 +12,7 @@ Example
 
 # Path to the log file (make sure it has proper permissions)
 # Default: disabled
-#UpdateLogFile /var/log/freshclam.log
+UpdateLogFile /var/log/freshclam.log
 
 # Maximum size of the log file.
 # Value of 0 disables the limit.
