class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.5'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.5/mmv_v0.1.5_darwin_arm64.zip'
      sha256 '07f170e50678fd6628088c43e8159fec8b3986ab6114e56ad9569c277d954071'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.5/mmv_v0.1.5_darwin_amd64.zip'
      sha256 '19e1731949ba439695a538c917b370943dd8963750d224296c54a8d04e1a4c15'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.5/mmv_v0.1.5_linux_arm64.tar.gz'
      sha256 '6c81cf9e663baba803e26cf55ac39bd4212cc08d140e09724e08aa835a32ec5c'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.5/mmv_v0.1.5_linux_amd64.tar.gz'
      sha256 'f2ae3f259dc3c0eaa864b20a3980271c1ab585b21e6cea29820ed4efbcc11b5d'
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
