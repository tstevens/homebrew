require 'formula'

class AppEngineJavaSdk <Formula
  @url='http://googleappengine.googlecode.com/files/appengine-java-sdk-1.3.0.zip'
  @homepage='http://code.google.com/appengine/docs/java/overview.html'
  @sha1='fb47e9e357a5122da8a8d5cd841b77f1f7bf0ce9'

  def install
    prefix.install Dir['*']
  end
end
