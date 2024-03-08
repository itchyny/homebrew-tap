class Rassemble < Formula
  homepage 'https://github.com/itchyny/rassemble-go'
  version '0.1.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.1/rassemble_v0.1.1_darwin_arm64.zip'
      sha256 'fd816c732e50fa9474e4a02b5b3d44b94aa6c98a5da1a906a89d8d8de924a37d'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.1/rassemble_v0.1.1_darwin_amd64.zip'
      sha256 'e337f5714496f73958794f00e77dd3586e6916b791aa209265915951b2ebfd86'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.1/rassemble_v0.1.1_linux_arm64.tar.gz'
      sha256 'ed67c6bd3497dcc0fb3c2c859352a87651aaa2eb74d0f517670e1992d6d81072'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.1/rassemble_v0.1.1_linux_amd64.tar.gz'
      sha256 'ab0a5b6be46c8316a356e6c1db9b2cadf6bc6c143fdadea19b06aafb6e5d0ece'
    end
  end

  head do
    url 'https://github.com/itchyny/rassemble-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rassemble'
  end

  test do
    system "#{bin}/rassemble", '-version'
  end
end
