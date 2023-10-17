class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.2.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.2.0/mackerel-plugin-battery_v0.2.0_darwin_arm64.zip'
      sha256 'd47916c2370deb37b3f82ce06c0bbd2ec3d40985294018844ffe586e02b98cdd'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.2.0/mackerel-plugin-battery_v0.2.0_darwin_amd64.zip'
      sha256 '1de822d9dd14c6554ec0f6d3f9e9280bcd521f38580c5536ee39f55c9378dd96'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.2.0/mackerel-plugin-battery_v0.2.0_linux_arm64.tar.gz'
      sha256 '91595a78ad6038085ca0db3a932f7f9170e0812a3909b6daebab4c576738efdb'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.2.0/mackerel-plugin-battery_v0.2.0_linux_amd64.tar.gz'
      sha256 '5eaa3cc9842dbe5652ce7895d0cf9af06ae698cbc0c7af10a8433606d978b597'
    end
  end

  head do
    url 'https://github.com/itchyny/mackerel-plugin-battery.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mackerel-plugin-battery'
  end

  test do
    system "#{bin}/mackerel-plugin-battery"
  end
end
