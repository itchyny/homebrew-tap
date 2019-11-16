class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.0.1'
  url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.1/mackerel-plugin-battery_v0.0.1_darwin_amd64.zip'
  sha256 '414fa8ef40d53229a2db109d5cde8fde6fb9ed945a4011bf44d0d19dd9cfaea6'

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
