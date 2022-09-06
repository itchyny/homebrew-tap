class Json2yaml < Formula
  homepage 'https://github.com/itchyny/json2yaml'
  version '0.1.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.3/json2yaml_v0.1.3_darwin_arm64.zip'
      sha256 '1f18e00fb481799d1a2c72d76396ed4f7d99c374802a063ecbbcde943f8f075c'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.3/json2yaml_v0.1.3_darwin_amd64.zip'
      sha256 '12dbb82ef56509f75338487c650a1102ac45368fc4f6be946cdfc12e9b50e1d8'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.3/json2yaml_v0.1.3_linux_arm64.tar.gz'
      sha256 '01b2fc4121d061f38d31359180c4eb0b8494a0c37cf6bd65fd8924f9f1bf2e43'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/json2yaml/releases/download/v0.1.3/json2yaml_v0.1.3_linux_amd64.tar.gz'
      sha256 '34bbfabb857375445d34f725f33e58783b6b58bf8c72841e72649cb2b0969093'
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
