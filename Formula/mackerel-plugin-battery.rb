class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.0.0'
  url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.0/mackerel-plugin-battery_v0.0.0_darwin_amd64.zip'
  sha256 '49dcf177b9fc0ecb1ebfe45d756c6cbd27a63ee28f7f596f9f120c7c9b29d47e'

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
