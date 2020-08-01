class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.0'

  if OS.mac?
    url 'https://github.com/itchyny/bed/releases/download/v0.2.0/bed_v0.2.0_darwin_amd64.zip'
    sha256 'e187964e997826fedd716ed2c848e8e37d195f2dc2426e9f2fcec895c7d204bb'
  elsif OS.linux?
    url 'https://github.com/itchyny/bed/releases/download/v0.2.0/bed_v0.2.0_linux_amd64.tar.gz'
    sha256 '0e96ee93e79cd2f47053a1995f770922dacc6822ff3acfafa5f4b171823c7dca'
  end

  head do
    url 'https://github.com/itchyny/bed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'bed'
  end

  test do
    system "#{bin}/bed", '--version'
  end
end
