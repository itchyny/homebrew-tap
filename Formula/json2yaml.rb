class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.4'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.4/json2yaml_v0.1.4_darwin_arm64.zip'
      sha256 '152526f015de83bed19c34cb395a7ffe95eaeb6e037241c03f2a900e8a238132'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.4/json2yaml_v0.1.4_darwin_amd64.zip'
      sha256 '1b502636eb7b484c0ae3b721cb07f2619dfbf5b819eac0c857f168874229c66c'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.4/json2yaml_v0.1.4_linux_arm64.tar.gz'
      sha256 'c9288f3a1c58e6b6222306e717f1b8e0ce8af036a4ceb2ef38cfb025ed113e64'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.4/json2yaml_v0.1.4_linux_amd64.tar.gz'
      sha256 '5305f6f4a03891359c1da224402844a1ccba57376daba94e0195d47ffd5df546'
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
