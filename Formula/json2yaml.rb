class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.2/json2yaml_v0.1.2_darwin_arm64.zip'
      sha256 '9f73002f5f872e033081745c67318d3252a3dc68f30048f98cfb0a3fa435c05a'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.2/json2yaml_v0.1.2_darwin_amd64.zip'
      sha256 '82ea5c9a790a362439b62702b6438fc7bb99730b9eb5e87249450c43f17baf69'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.2/json2yaml_v0.1.2_linux_arm64.tar.gz'
      sha256 '5aaa9b7c4ef06df406940931314c6a31127bc6d15fd62286e14b388ea49a6e2c'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.2/json2yaml_v0.1.2_linux_amd64.tar.gz'
      sha256 'e9e5c710b487ffde23bba947535d8bd968d01cc9d6aff6a8214a64844ca73847'
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
