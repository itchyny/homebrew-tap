class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.0.2'
  url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.2/mackerel-plugin-battery_v0.0.2_darwin_amd64.zip'
  sha256 'f16c7c02cb5926f0b3a8410a0e6599e6cdf244c8ac4221b2b1b812120f5643df'

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
