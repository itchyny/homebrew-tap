class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.8'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.8/miv_v0.4.8_darwin_amd64.zip'
    sha256 'fd248acdd938bb6cec237ae7adde30ff969e89c995c5d390594eede92ca8a239'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.8/miv_v0.4.8_linux_amd64.zip'
    sha256 '9f9ca9624bc2edab80c190e1040455a5387f51595d3038622e25387dfc79e8d6'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
