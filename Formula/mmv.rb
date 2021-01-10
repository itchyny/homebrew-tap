class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.3'

  if OS.mac?
    url 'https://github.com/itchyny/mmv/releases/download/v0.1.3/mmv_v0.1.3_darwin_amd64.zip'
    sha256 '51b485da0fc9d7be73cc24392b22541c0ab3760396f5b27030f392aafd59bf9d'
  elsif OS.linux?
    url 'https://github.com/itchyny/mmv/releases/download/v0.1.3/mmv_v0.1.3_linux_amd64.tar.gz'
    sha256 'a43638043acf1285b2d3717ef45fc50952363258c9b5d2bab59bda6f54f5dc27'
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
