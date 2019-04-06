class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.0.4'
  url 'https://github.com/itchyny/base58-go/releases/download/v0.0.4/base58_v0.0.4_darwin_amd64.zip'
  sha256 '5521f9ccf17e9abff1de99baf490ebeffae31033ca14d7c89f139b5506333df4'

  head do
    url 'https://github.com/itchyny/base58-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/base58'
    else
      bin.install 'base58'
    end
    zsh_completion.install "_base58"
  end

  test do
    system "#{bin}/base58", '--version'
  end
end
