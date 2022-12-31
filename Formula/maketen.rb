class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.1.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.1/maketen_v0.1.1_darwin_arm64.zip'
      sha256 '686ea0a350b20308d9727bb718558756b7af8249e828e48bc40c29f148fd533f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.1/maketen_v0.1.1_darwin_amd64.zip'
      sha256 '2ffaaf4ab8d13e0fcf6db7716a83b157cf23f4b9b6da00387272c1a98963ebf3'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.1/maketen_v0.1.1_linux_arm64.tar.gz'
      sha256 'aa1e53751acdac2010d3ec6b63eba10a8e0e17464410f9693e34606573d63727'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.1/maketen_v0.1.1_linux_amd64.tar.gz'
      sha256 'eb3cf97c170eb236863e4c564ea840b43bf39aed3dfa4198d9109ff77b5ddf60'
    end
  end

  head do
    url 'https://github.com/itchyny/maketen-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maketen'
  end

  test do
    system "#{bin}/maketen", '-v'
  end
end
