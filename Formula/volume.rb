class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.2.1'

  if OS.mac?
    url 'https://github.com/itchyny/volume-go/releases/download/v0.2.1/volume_v0.2.1_darwin_amd64.zip'
    sha256 'dccd0546625ca51efb86b9f35befd5ac0a0424f60c6362a81ee496155809a381'
  elsif OS.linux?
    url 'https://github.com/itchyny/volume-go/releases/download/v0.2.1/volume_v0.2.1_linux_amd64.tar.gz'
    sha256 '13744c8425e19db56280a1f190539be446a42d276043edcaeb7fefe5e48b3824'
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
