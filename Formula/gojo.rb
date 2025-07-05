class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.3.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.3/gojo_v0.3.3_darwin_arm64.zip'
      sha256 '08674e388433d03b03bc8e60e564e028da3ff464635d964107db3fa7758146ba'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.3/gojo_v0.3.3_darwin_amd64.zip'
      sha256 '90fe1c43d7ac38d287bd99f81d3edbd4b6ae3dce8b14304fe87f3cca5a0d82ad'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.3/gojo_v0.3.3_linux_arm64.tar.gz'
      sha256 'f78d1e3bb06815cb326ea23cafb75fc1016371b13cb7b81d1a656d0fb083adce'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.3/gojo_v0.3.3_linux_amd64.tar.gz'
      sha256 'f4e3edccf6dd8bb7a8e147a3fee74fcc98dd589dc70bff774ce15605ca921ebc'
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
