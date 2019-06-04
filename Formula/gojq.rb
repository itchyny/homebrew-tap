class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.3.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.3.0/gojq_v0.3.0_darwin_amd64.zip'
  sha256 'ebd82326f9370333148a36ac652c44ec937a52172689c4901fe6bce1195122de'

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/gojq'
    else
      bin.install 'gojq'
    end
  end

  test do
    system "#{bin}/gojq", '-v'
  end
end
