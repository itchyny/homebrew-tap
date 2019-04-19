class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.0.5'
  url 'https://github.com/itchyny/base58-go/releases/download/v0.0.5/base58_v0.0.5_darwin_amd64.zip'
  sha256 '9dbbfdc2bb33df89b9dbf274db2a8a5afadda55351bf9cf2a2727fae10f70f06'

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
