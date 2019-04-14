class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.0.1'
  url 'https://github.com/itchyny/gojq/releases/download/v0.0.1/gojq_v0.0.1_darwin_amd64.zip'
  sha256 'f60e4f1a8f71dd498b3f721300a96e3e8ef39cc8a4fc085a9d58e8d1105990bc'

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
