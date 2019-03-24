class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.0.3'
  url 'https://github.com/itchyny/base58-go/releases/download/v0.0.3/base58_darwin_amd64.zip'
  sha256 'f4fc1d777857c2b5a158310ca2a1e523e2e9ef00238fa9f7c0a22de0eec5daf1'

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
