class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.3.0'
  url 'https://github.com/itchyny/miv/releases/download/v0.3.0/miv_darwin.zip'
  sha256 '001ae921f2286fc249d08f0f62d90f92205f44f821591120240c202623217d88'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
