class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.0.1'
  url 'https://github.com/itchyny/base58-go/releases/download/v0.0.1/base58_darwin_amd64.zip'
  sha256 '2f3d8082c6ed03395dbb74b9d934f5364b757b2c0f69b510e99e73bf5773f1d8'

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
