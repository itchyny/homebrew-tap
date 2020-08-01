class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.0.3'

  if OS.mac?
    url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.3/mackerel-plugin-battery_v0.0.3_darwin_amd64.zip'
    sha256 'd0fd666bbbb6613efb670980b4a10075ec636d446e66ece8885f99471d192e59'
  elsif OS.linux?
    url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.0.3/mackerel-plugin-battery_v0.0.3_linux_amd64.tar.gz'
    sha256 'cb2f2b1be7c171bd35f91f41aea502c26865c8a81f2bfde6614c0ee759d7b68c'
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
