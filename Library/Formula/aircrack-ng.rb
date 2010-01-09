require 'formula'

class AircrackNg <Formula
  url 'http://nightly.aircrack-ng.org/aircrack-ng/trunk/aircrack-ng-trunk-2010-01-09-r1645.tar.gz'
  homepage 'http://aircrack-ng.org/'
  md5 '295c0fdddd578bf9ccc3dc77b407f987'
  version 'r1645'
  
  def install
    # Force i386
    %w{ CFLAGS CXXFLAGS LDFLAGS OBJCFLAGS OBJCXXFLAGS }.each do |compiler_flag|
      ENV.remove compiler_flag, "-arch x86_64"
      ENV.append compiler_flag, "-arch i386"
    end
    
    system "make"
    system "make prefix=#{prefix} install"
  end
end
