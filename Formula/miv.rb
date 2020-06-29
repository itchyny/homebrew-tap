class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.2'
  url 'https://github.com/itchyny/miv/releases/download/v0.4.2/miv_v0.4.2_darwin_amd64.zip'
  sha256 'bb47e4e49fec39e5ff813a1cc0e31cad51adef9339063aab6a27a7c353316957'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
