class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.12.0'

  if OS.mac?
    url 'https://github.com/itchyny/gojq/releases/download/v0.12.0/gojq_v0.12.0_darwin_amd64.zip'
    sha256 'c40968aabfbb03900d805305f1e4a5bf610489051367f212830250f793f4dc32'
  elsif OS.linux?
    url 'https://github.com/itchyny/gojq/releases/download/v0.12.0/gojq_v0.12.0_linux_amd64.tar.gz'
    sha256 '9fb81d973051ff64d5bca45ffde4e00f56966f467426974a86797df2985f2817'
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
