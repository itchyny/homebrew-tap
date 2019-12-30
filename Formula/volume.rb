class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.1.0'
  url 'https://github.com/itchyny/volume-go/releases/download/v0.1.0/volume_v0.1.0_darwin_amd64.zip'
  sha256 '19bf1bb45a7998af55612ff4e91025812ffa17b9b9cf387c3d6fb2ed576cc0a1'

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
