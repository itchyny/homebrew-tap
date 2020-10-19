class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.3'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.3/miv_v0.4.3_darwin_amd64.zip'
    sha256 'cb7baeb56a4e7b150605f3fe479ed6561bea6f9456460f6db0efa3f6f9b78641'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.3/miv_v0.4.3_linux_amd64.zip'
    sha256 '39a08bd7fff8787ee846cd6858bfe0c860dd49270215bd22f1946437766b2bed'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
