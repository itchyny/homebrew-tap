class MackerelPluginLoadavg < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-loadavg'
  version '0.2.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.0/mackerel-plugin-loadavg_v0.2.0_darwin_arm64.zip'
      sha256 'c4d3931ea98f8e70ed5653e96908201fdb298df9567b31d418551634c1199632'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.0/mackerel-plugin-loadavg_v0.2.0_darwin_amd64.zip'
      sha256 '8922c8af1105b666524ea4744e5dc8fd90f323e11bbc7143fccb75660d6d6782'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.0/mackerel-plugin-loadavg_v0.2.0_linux_arm64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-loadavg/releases/download/v0.2.0/mackerel-plugin-loadavg_v0.2.0_linux_amd64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
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
