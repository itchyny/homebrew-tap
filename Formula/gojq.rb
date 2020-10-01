class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.11.2'

  if OS.mac?
    url 'https://github.com/itchyny/gojq/releases/download/v0.11.2/gojq_v0.11.2_darwin_amd64.zip'
    sha256 '827f1e7b1fde18e18d4828460deebbfe8756b3a615b65948ef5bb7f58a66c2ff'
  elsif OS.linux?
    url 'https://github.com/itchyny/gojq/releases/download/v0.11.2/gojq_v0.11.2_linux_amd64.tar.gz'
    sha256 'c3e4e4680eef269a0c4db2e999772eea1551ebefe257911f3bee4589db7e415d'
  end

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
