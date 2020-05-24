class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.10.2'
  url 'https://github.com/itchyny/gojq/releases/download/v0.10.2/gojq_v0.10.2_darwin_amd64.zip'
  sha256 '47d391656b3321eac62c44bda13eda0022e1896fa865838651711530517fe02c'

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
