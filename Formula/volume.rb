class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.2.0'
  url 'https://github.com/itchyny/volume-go/releases/download/v0.2.0/volume_v0.2.0_darwin_amd64.zip'
  sha256 'd7052f1910a425acb215eb841c402dab470856914a2dbe1463d97d50f8a117ff'

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
