class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.10.1'
  url 'https://github.com/itchyny/gojq/releases/download/v0.10.1/gojq_v0.10.1_darwin_amd64.zip'
  sha256 '359b1ecf5670232b76c0cd99966a92611b15c5860df5b29ec6be6132429a63f3'

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
