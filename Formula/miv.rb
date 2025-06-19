class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.9'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.9/miv_v0.4.9_darwin_arm64.zip'
    sha256 '095164e839be64723cd61f9cf65f2aa76a91b4a27496c49e690639fd91affa37'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.9/miv_v0.4.9_linux_amd64.zip'
    sha256 '167ae69a8814d184ba50373fd005298cc346f0578ad6ed64b6156ceaf64c395e'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
