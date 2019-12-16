class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.0'
  url 'https://github.com/itchyny/miv/releases/download/v0.4.0/miv_darwin.zip'
  sha256 'a17217cc9925c46ad77c1988d801b1e97e6faedd97898dbd21893dccbb310b87'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
