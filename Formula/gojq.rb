class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.9.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.9.0/gojq_v0.9.0_darwin_amd64.zip'
  sha256 '4f7bd119cd27467e6b7faefc720dbcb77264e9bdf71e44abd428f4d5cf0bdfae'

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
