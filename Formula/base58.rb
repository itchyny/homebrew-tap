class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.2.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.1/base58_v0.2.1_darwin_arm64.zip'
      sha256 '23fca079e416d5db9595e0a929ada44d4fe19292b9299822f7704114047b0cfc'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.1/base58_v0.2.1_darwin_amd64.zip'
      sha256 '0ab3d179f9aae5da3f6768ceeedb7fecd29cc77d25d215a8be6fab8a31cd4f87'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.1/base58_v0.2.1_linux_arm64.tar.gz'
      sha256 '8a714e0f8323234104bb3b4f3803d186481bee6f9191740586050ce51a6e87c9'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.1/base58_v0.2.1_linux_amd64.tar.gz'
      sha256 '2185c2132700faacb4e0e3ec08ee9277e07a6d8ba4ce5789b34d0cc457dbacaf'
    end
  end

  head do
    url 'https://github.com/itchyny/base58-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    else
    end
    bin.install 'base58'
    zsh_completion.install "_base58"
  end

  test do
    system "#{bin}/base58", '--version'
  end
end
