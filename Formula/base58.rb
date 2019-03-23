class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.0.2'
  url 'https://github.com/itchyny/base58-go/releases/download/v0.0.2/base58_darwin_amd64.zip'
  sha256 '66f11c9bffa14775168f73d2583a402dc9379872cc6e9dfc8cee3bf95b750030'

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
  end

  test do
    system "#{bin}/base58", '--version'
  end
end
