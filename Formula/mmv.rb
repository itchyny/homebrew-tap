class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.2'

  if OS.mac?
    url 'https://github.com/itchyny/mmv/releases/download/v0.1.2/mmv_v0.1.2_darwin_amd64.zip'
    sha256 '696a431b6c383dd41d6907da32ffb20f8dbc1ba32bef45090106f1e813cce319'
  elsif OS.linux?
    url 'https://github.com/itchyny/mmv/releases/download/v0.1.2/mmv_v0.1.2_linux_amd64.tar.gz'
    sha256 'cdcde030c628369424322043f442c4f324eec6bf55d2f3a9ebab22f3857d625a'
  end

  head do
    url 'https://github.com/itchyny/mmv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mmv'
  end

  test do
    system "#{bin}/mmv", '--version'
  end
end
