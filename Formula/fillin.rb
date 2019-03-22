class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.1.1'
  url 'https://github.com/itchyny/fillin/releases/download/v0.1.1/fillin_darwin_amd64.zip'
  sha256 '5fbab2e595b3cebafa2309c47356ee788483495541fedc829009a2cad9d8eb32'

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
