class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.3.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/fillin/releases/download/v0.3.3/fillin_v0.3.3_darwin_arm64.zip'
      sha256 '12a373d8d1a3d97b8a3c7f40e6ef85306ec23f8750d962ce6d9c079f2f6fe8e7'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/fillin/releases/download/v0.3.3/fillin_v0.3.3_darwin_amd64.zip'
      sha256 'c26a9a366541c4d7135b3b80b9f86bc874e3f8a92c6b31a000490028c2258ffc'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/fillin/releases/download/v0.3.3/fillin_v0.3.3_linux_arm64.tar.gz'
      sha256 'c5c7e472fea2a8d47009d6d29c17ed35289e4c097fece018016f847191c425a0'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/fillin/releases/download/v0.3.3/fillin_v0.3.3_linux_amd64.tar.gz'
      sha256 '36a8e39407bc0cadbcc155e07ed2dcb503c7d9df4c596f135c7f6a64a2c31d11'
    end
  end

  head do
    url 'https://github.com/itchyny/fillin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'fillin'
  end

  test do
    system "#{bin}/fillin", '--version'
  end
end
