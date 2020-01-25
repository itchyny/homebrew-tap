class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.1'
  url 'https://github.com/itchyny/miv/releases/download/v0.4.1/miv_v0.4.1_darwin_amd64.zip'
  sha256 '0d6f6c3b884cbf228ff978882fc317838701adf7eabcccf7acb86a16ef04b3bd'

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
