class Mkrg < Formula
  homepage 'https://github.com/itchyny/mkrg'
  version '0.0.2'
  url 'https://github.com/itchyny/mkrg/releases/download/v0.0.2/mkrg_v0.0.2_darwin_amd64.zip'
  sha256 '0a4a768d0fc5883a3daab7a4ae293d8e3b7a27aa21816e3c40f7cacd3af4dac3'

  head do
    url 'https://github.com/itchyny/mkrg.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/mkrg'
    else
      bin.install 'mkrg'
    end
  end

  test do
    system "#{bin}/mkrg", '--version'
  end
end
