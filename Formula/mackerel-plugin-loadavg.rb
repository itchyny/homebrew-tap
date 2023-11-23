class MackerelPluginLoadavg < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-loadavg'
  version '0.2.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.1/mackerel-plugin-loadavg_v0.2.1_darwin_arm64.zip'
      sha256 '7f08d1039fb704b0da4e5fa7d8d4b7455d91d4bc528b02d1e00d65a40c8ccce5'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.1/mackerel-plugin-loadavg_v0.2.1_darwin_amd64.zip'
      sha256 '8e8a49ece4905b317c0b237a7c17db3f5703fce05d1b7e502b1e01fd367fd468'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.1/mackerel-plugin-loadavg_v0.2.1_linux_arm64.zip'
      sha256 'c6902f78bd91a150ed266095da71a81a2167b628d027d55072f1330743820caf'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.1/mackerel-plugin-loadavg_v0.2.1_linux_amd64.zip'
      sha256 'd35a618ea9000afe0da9ef5bfa1ec58f15385ae12738e8e66ff9c7e8822e2483'
    end
  end

  head do
    url 'https://github.com/itchyny/mackerel-plugin-loadavg.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'mackerel-plugin-loadavg'
    end
  end

  test do
    system "#{bin}/mackerel-plugin-loadavg"
  end
end
