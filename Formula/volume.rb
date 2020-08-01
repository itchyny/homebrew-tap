class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.2.0'

  if OS.mac?
    url 'https://github.com/itchyny/volume-go/releases/download/v0.2.0/volume_v0.2.0_darwin_amd64.zip'
    sha256 'd7052f1910a425acb215eb841c402dab470856914a2dbe1463d97d50f8a117ff'
  elsif OS.linux?
    url 'https://github.com/itchyny/volume-go/releases/download/v0.2.0/volume_v0.2.0_linux_amd64.tar.gz'
    sha256 '82529beb9cb226b958676aec6c71170454e6cf7a5c7f787858eef4ca0b52bebc'
  end

  head do
    url 'https://github.com/itchyny/volume-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'volume'
  end

  test do
    system "#{bin}/volume", '--version'
  end
end
