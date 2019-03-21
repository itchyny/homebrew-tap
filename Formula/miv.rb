class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.3.1'
  url 'https://github.com/itchyny/miv/releases/download/v0.3.1/miv_darwin.zip'
  sha256 '303f867a596f608aff2d54c646277631a2b5e3483e993deab9008f1355711a14'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
