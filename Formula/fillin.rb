class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.2.0'
  url 'https://github.com/itchyny/fillin/releases/download/v0.2.0/fillin_v0.2.0_darwin_amd64.zip'
  sha256 'bc6a8ed61d5750d39a6fadc1eed5b695da99e4619067c3b311e1deedb069d9d0'

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
