class Sjsp < Formula
  homepage 'https://github.com/itchyny/sjsp'
  version '0.1.1'
  url 'https://github.com/itchyny/sjsp/releases/download/v0.1.1/sjsp_darwin.zip'
  sha256 'dbaa72a8b5d91dbf117e290e8568706393f6ea8e4308688c9ddc6de6a6ebcc8a'

  def install
    bin.install 'sjsp'
  end

  test do
    system "#{bin}/sjsp", '--version'
  end
end
