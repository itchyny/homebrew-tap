class MackerelPluginUptime < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-uptime'
  version '0.2.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.2/mackerel-plugin-uptime_v0.2.2_darwin_arm64.zip'
      sha256 'b1c8df771cac3f57a71d49c93c8ff4ac6cf55df175886c1247eeaabc9156675c'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.2/mackerel-plugin-uptime_v0.2.2_darwin_amd64.zip'
      sha256 '92be251f8980121631a17bbba4bfbecd37e1798e0c1dc5d7ef34e24ae1044c43'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.2/mackerel-plugin-uptime_v0.2.2_linux_arm64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.2/mackerel-plugin-uptime_v0.2.2_linux_amd64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    end
  end

  head do
    url 'https://github.com/itchyny/mackerel-plugin-uptime.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'mackerel-plugin-uptime'
    end
  end

  test do
    system "#{bin}/mackerel-plugin-uptime"
  end
end
