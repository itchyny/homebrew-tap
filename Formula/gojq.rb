class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.8.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.8.0/gojq_v0.8.0_darwin_amd64.zip'
  sha256 'edef79b8e8874aec64fbd8859e09eeea16f0d354280578f40739a17aeb4a5e83'

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
