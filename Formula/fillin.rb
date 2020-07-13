class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.3.1'
  url 'https://github.com/itchyny/fillin/releases/download/v0.3.1/fillin_v0.3.1_darwin_amd64.zip'
  sha256 '5fedafb6052b7ace35b68568598fa017737b050eb5a67e7ce614a98d73bbfdea'

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
