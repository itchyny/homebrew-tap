class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.4'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.4/miv_v0.4.4_darwin_amd64.zip'
    sha256 '7f0c13903ade7dd1d56d3dae8581861a57ac636be52e209b0a75070590a4bd4d'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.4/miv_v0.4.4_linux_amd64.zip'
    sha256 'b564cb5de8c6c45253c449c445299e9b573e45617d4060010e79a0862f298f0a'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
