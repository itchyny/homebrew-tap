class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.0.3'
  url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.3/mackerel-plugin-battery_v0.0.3_darwin_amd64.zip'
  sha256 'd0fd666bbbb6613efb670980b4a10075ec636d446e66ece8885f99471d192e59'

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
