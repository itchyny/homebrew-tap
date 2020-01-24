class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.0.2'
  url 'https://github.com/itchyny/maketen-go/releases/download/v0.0.2/maketen_v0.0.2_darwin_amd64.zip'
  sha256 '752741f64ca9bf06d4d0e1cf5503c8bc5e282aa69c4a611a267c264739494b60'

  head do
    url 'https://github.com/itchyny/maketen-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maketen'
  end

  test do
    system "#{bin}/maketen", '-v'
  end
end
