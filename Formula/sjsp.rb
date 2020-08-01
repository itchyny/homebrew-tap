class Sjsp < Formula
  homepage 'https://github.com/itchyny/sjsp'
  version '0.1.1'

  if OS.mac?
    url 'https://github.com/itchyny/sjsp/releases/download/v0.1.1/sjsp_darwin.zip'
    sha256 'dbaa72a8b5d91dbf117e290e8568706393f6ea8e4308688c9ddc6de6a6ebcc8a'
  elsif OS.linux?
    url 'https://github.com/itchyny/sjsp/releases/download/v0.1.1/sjsp_linux.zip'
    sha256 'd8affc8a5c1679ae3bd1cabae6ceb4edcabf99df9cd233d20fc97bd39c308a70'
  end

  def install
    bin.install 'sjsp'
  end

  test do
    system "#{bin}/sjsp", '--version'
  end
end
