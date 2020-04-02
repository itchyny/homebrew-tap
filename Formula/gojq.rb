class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.10.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.10.0/gojq_v0.10.0_darwin_amd64.zip'
  sha256 '564b9f443383b726c4d988e1f1a86e0e2263f91707fca5c72b7438d3a62a3c9c'

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojq'
    zsh_completion.install "_gojq"
  end

  test do
    system "#{bin}/gojq", '--version'
  end
end
