class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.6'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.6/mmv_v0.1.6_darwin_arm64.zip'
      sha256 '910ce029e109dc336ae110633bc10652a1237328d7b57dbf89c45095bf548b3f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.6/mmv_v0.1.6_darwin_amd64.zip'
      sha256 '06e939243a7f02ff7640c3bca34bd1ba6346ae0750ae4580e4ebae131d0ccc4b'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.6/mmv_v0.1.6_linux_arm64.tar.gz'
      sha256 '0ac808bf39763d09d1416a449c57fb052b7c6d4fd3ee1d678aad97b4bae179aa'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.6/mmv_v0.1.6_linux_amd64.tar.gz'
      sha256 '4afb3b06f055f483212d718e46460d7a241698ed50bd45e092d1bc8c0c08852b'
    end
  end

  head do
    url 'https://github.com/itchyny/mmv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mmv'
  end

  test do
    system "#{bin}/mmv", '--version'
  end
end
