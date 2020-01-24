class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.3.0'
  url 'https://github.com/itchyny/fillin/releases/download/v0.3.0/fillin_v0.3.0_darwin_amd64.zip'
  sha256 'db349be77a35da6e91511edc8b11fb624d0cf80b32756863c48b81f675e36bdb'

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
