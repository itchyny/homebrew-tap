class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.3.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.2/gojo_v0.3.2_darwin_arm64.zip'
      sha256 'f6f008b46da672feca0b210c1064b423a2b92524ef0fe14da237c65a911b42f3'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.2/gojo_v0.3.2_darwin_amd64.zip'
      sha256 '8a35de675d90da9cf393ca60fb73e4cce32466f3bf087152a7d906cfad0dacb0'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.2/gojo_v0.3.2_linux_arm64.tar.gz'
      sha256 '157e261ab5cf0b83ffd147533dc49fdc9ad1ccf2c250967e3aa3271aeee6d82e'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.2/gojo_v0.3.2_linux_amd64.tar.gz'
      sha256 'c3211d5726992afc6d2dc08e6bab3755fe540fa3310f5b81d4ca59e8c0905d8a'
    end
  end

  head do
    url 'https://github.com/itchyny/gojo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojo'
    zsh_completion.install "_gojo"
  end

  test do
    system "#{bin}/gojo", '-v'
  end
end
