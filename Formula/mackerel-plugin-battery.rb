class MackerelPluginBattery < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-battery'
  version '0.1.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.1.0/mackerel-plugin-battery_v0.1.0_darwin_arm64.zip'
      sha256 'f43be04e0c757f2555902120f7792f0d4b2a2f584838973bf1d93dc240da3a20'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.1.0/mackerel-plugin-battery_v0.1.0_darwin_amd64.zip'
      sha256 'a517ee8f70d74aef4bd5dba739baf871af05f966b0c8b1e2b9e33257bb8b4fb8'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.1.0/mackerel-plugin-battery_v0.1.0_linux_arm64.tar.gz'
      sha256 '76dc24a9f9de38338a899d0981133b02d383a7ce3c902d2deb60e92569803d53'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-battery/releases/download/v0.1.0/mackerel-plugin-battery_v0.1.0_linux_amd64.tar.gz'
      sha256 '62c8a31df650309110b0f6a0db2d117e18c0f4a1d85bae914714c1f528f76fdb'
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
