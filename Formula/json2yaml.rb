class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.1/json2yaml_v0.1.1_darwin_arm64.zip'
      sha256 'd4e2c0b6935a53c87178818b02333991e54cbd2741c058c4ffba1b9f463e4aa5'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.1/json2yaml_v0.1.1_darwin_amd64.zip'
      sha256 'c92f2470e945c52f4f6712f31465ec793ed463d97d49456ab988cef7d9a1c8ae'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.1/json2yaml_v0.1.1_linux_arm64.tar.gz'
      sha256 '9d519e109787ea34a1673ebfe50df9f646f3267ef56671a1eb3589bf8827607b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.1/json2yaml_v0.1.1_linux_amd64.tar.gz'
      sha256 'd4ac3e85458f2ed0ce9d4b1533c56627c15913ba3305ca2cf9b6d9177627035f'
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
