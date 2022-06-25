class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.2.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.2/volume_v0.2.2_darwin_arm64.zip'
      sha256 '83aa90e8e08f8ba1a3ed069dd380af49cbfc23a1514650edf023c6387f550e01'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.2/volume_v0.2.2_darwin_amd64.zip'
      sha256 '8cd37b82621cc7982ac543e730086ca6027c7ba9b59fb45838c29d5239003e45'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.2/volume_v0.2.2_linux_arm64.tar.gz'
      sha256 '4d6eb268fdb665ef305f52cfbe9e017520965f0ff34c1a913be5005c91c6649e'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.2/volume_v0.2.2_linux_amd64.tar.gz'
      sha256 '88e4ab38a15998d5b3ddd708fe0a263b76cad525992ecbcd1a98dcec9fa60020'
    end
  end

  head do
    url 'https://github.com/itchyny/volume-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'volume'
  end

  test do
    system "#{bin}/volume", '--version'
  end
end
