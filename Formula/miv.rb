class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.3.2'
  url 'https://github.com/itchyny/miv/releases/download/v0.3.2/miv_darwin.zip'
  sha256 '70c391481cb68366b709b7832fcbdccb9e1bd65bf5c7b27c374d8e8537979cd5'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
