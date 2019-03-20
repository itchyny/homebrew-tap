class Mkrg < Formula
  homepage 'https://github.com/itchyny/mkrg'
  version '0.0.1'
  url 'https://github.com/itchyny/mkrg/releases/download/v0.0.1/mkrg_darwin_amd64.zip'
  sha256 '8797e98c1ddd2a75995c6a9ba9771167a93939fa53a98903ff689255d2d3b736'

  head do
    url 'https://github.com/itchyny/mkrg.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/mkrg'
    else
      bin.install 'mkrg'
    end
  end

  test do
    system "#{bin}/mkrg", '--version'
  end
end
