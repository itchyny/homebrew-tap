class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.0/json2yaml_v0.1.0_darwin_arm64.zip'
      sha256 '083d2384e7f9cee1e0f97e137acb8945163e0bf71f95ee5170b88437dbde8798'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.0/json2yaml_v0.1.0_darwin_amd64.zip'
      sha256 '2201452c70059b9acc6eb43eccb9ee795f9b2c59c014af539e42d4a5235b2667'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.0/json2yaml_v0.1.0_linux_arm64.tar.gz'
      sha256 '6d3e80f7d57515905ebe3d979164283f0d22e7e063874be3f773249e65f8da9b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.0/json2yaml_v0.1.0_linux_amd64.tar.gz'
      sha256 'febd6fd15a5f901ada0a0562e75ffbb4334e3e610885f92ae2b2e178c60b110a'
    end
  end

  head do
    url 'https://github.com/itchyny/json2yaml.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'json2yaml'
  end

  test do
    system "#{bin}/json2yaml", '-version'
  end
end
