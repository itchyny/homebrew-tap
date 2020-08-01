class MackerelPluginUptime < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-uptime'
  version '0.2.0'

  if OS.mac?
    url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.0/mackerel-plugin-uptime_v0.2.0_darwin_amd64.zip'
    sha256 'af93d025f1afa8071be1434131cafba812532bf033dfae544ae8f0854299d35f'
  elsif OS.linux?
    url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.0/mackerel-plugin-uptime_v0.2.0_linux_amd64.zip'
    sha256 'fcc1804942c23762ff4b4981a3e0c4e590369ac3b2b1e41f0c163f905d1058ac'
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
