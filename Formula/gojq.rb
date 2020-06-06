class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.10.3'
  url 'https://github.com/itchyny/gojq/releases/download/v0.10.3/gojq_v0.10.3_darwin_amd64.zip'
  sha256 '3c248bd78a0fc80d78ac684e13f9359dd957f063d8f3416ae79d0c31f4da9d92'

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
