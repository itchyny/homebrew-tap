class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.7'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.7/miv_v0.4.7_darwin_amd64.zip'
    sha256 '5bb7ac1d8365e47911f55ea90b966d6ad72a09309e271a1409ce4ca78631558d'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.7/miv_v0.4.7_linux_amd64.zip'
    sha256 'b8b33d9bd49b1d70f1ed39b07df4187a834b56a73e1fdfc2ad32425b9b1a0e0e'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
