class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.4'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.4/mmv_v0.1.4_darwin_arm64.zip'
      sha256 'a5ad36cac85b67f743e958a1c9fe24f0f50068d0fa755a6cc26b3f66a91d821e'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.4/mmv_v0.1.4_darwin_amd64.zip'
      sha256 'e5c93c0c82cfdab21701743e7507e26014f8ef539c8b0712eca5a65b16dbb906'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.4/mmv_v0.1.4_linux_arm64.tar.gz'
      sha256 'ec2e3fcc9883664744688c24f4030cf9a4fb2f37767f062ccc9f38da42554a02'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mmv/releases/download/v0.1.4/mmv_v0.1.4_linux_amd64.tar.gz'
      sha256 '02d9c1e29f1fe1af98b7f73d9a0033c0714e9a5e1b97070ab00e0fc8f74e620f'
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
