class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.1.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.1.0/gojq_v0.1.0_darwin_amd64.zip'
  sha256 'f1d333b8d6620cef81c01b6bbb61bfe8da2df6ce8eb637750c30baa0be4eb6b2'

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
