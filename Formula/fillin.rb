class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.1.0'
  url 'https://github.com/itchyny/fillin/releases/download/v0.1.0/fillin_darwin_amd64.zip'
  sha256 '7bfd78f881b41bf841702f5ccf39ce8459dca9d803e5a9aa5683fc7707dcfcc0'

  head do
    url 'https://github.com/itchyny/fillin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/fillin'
    else
      bin.install 'fillin'
    end
  end

  test do
    system "#{bin}/fillin", '--version'
  end
end
