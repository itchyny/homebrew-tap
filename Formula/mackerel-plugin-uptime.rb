class MackerelPluginUptime < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-uptime'
  version '0.2.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.1/mackerel-plugin-uptime_v0.2.1_darwin_arm64.zip'
      sha256 'ca026106524f617867a5ce26f9f9d660d190c98679638b52210518402b676852'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.1/mackerel-plugin-uptime_v0.2.1_darwin_amd64.zip'
      sha256 '7d9ef7572691d22a9cb1ceb8b5220f8eeee0eac1047b703d3f0e7f7c96489791'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.1/mackerel-plugin-uptime_v0.2.1_linux_arm64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-uptime/releases/download/v0.2.1/mackerel-plugin-uptime_v0.2.1_linux_amd64.tar.gz'
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
