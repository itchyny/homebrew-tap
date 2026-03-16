class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.5'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.5/json2yaml_v0.1.5_darwin_arm64.zip'
      sha256 '147eabdf0227c54a8dd307a20ec087b6209c113dad3673330b88a23b7c9788b5'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.5/json2yaml_v0.1.5_darwin_amd64.zip'
      sha256 '81cdc56adefb6992b737eb48f6fbfab5fedcc2aa4c4a3cb10731b5456c7aaea2'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.5/json2yaml_v0.1.5_linux_arm64.tar.gz'
      sha256 '18c5a98364059d15c21078721633cb7f536f8eb2cab4e61d90b80e2f6dec212b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.5/json2yaml_v0.1.5_linux_amd64.tar.gz'
      sha256 'cdbe06d731cbd4c5e4b4e286119440783db5a49055d6d99f6930def87f864d70'
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
