class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.2.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.0/base58_v0.2.0_darwin_arm64.zip'
      sha256 'b3e92ec8330be1c306c25cdb472d15660cc5f8c7ee6d971f59fb0b1031554517'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.0/base58_v0.2.0_darwin_amd64.zip'
      sha256 '98c0fa3c4def0486603f84214aa615af550b25fab82c53141e067f74a0cf62ce'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.0/base58_v0.2.0_linux_arm64.tar.gz'
      sha256 '2f773520356fbc6cf91cf272e748e3fae1b60b06f4b7063d6dc6c5262192c290'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.0/base58_v0.2.0_linux_amd64.tar.gz'
      sha256 'e27910834ce01a445ed157a6fbf1cc2aaf27141672874eb584f2ceb3adacc9b0'
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
