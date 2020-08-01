class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.3.1'

  if OS.mac?
    url 'https://github.com/itchyny/fillin/releases/download/v0.3.1/fillin_v0.3.1_darwin_amd64.zip'
    sha256 '5fedafb6052b7ace35b68568598fa017737b050eb5a67e7ce614a98d73bbfdea'
  elsif OS.linux?
    url 'https://github.com/itchyny/fillin/releases/download/v0.3.1/fillin_v0.3.1_linux_amd64.tar.gz'
    sha256 'ddd5e8c56af6378b4c412d7ee61bdc8932673886e4afdfc66f7bc85c9fdc6df0'
  end

  head do
    url 'https://github.com/itchyny/fillin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'fillin'
  end

  test do
    system "#{bin}/fillin", '--version'
  end
end
