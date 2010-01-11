require 'formula'

class AircrackNg <Formula
  head 'http://trac.aircrack-ng.org/svn/trunk/'
  homepage 'http://aircrack-ng.org/'
  
  def install
    # Force i386
    %w{ CFLAGS CXXFLAGS LDFLAGS OBJCFLAGS OBJCXXFLAGS }.each do |compiler_flag|
      ENV.remove compiler_flag, "-arch x86_64"
      ENV.append compiler_flag, "-arch i386"
    end
    
    system "make"
    system "make prefix=#{prefix} install"
  end
  
  def download_strategy
    SubversionDownloadStrategy
  end
end
