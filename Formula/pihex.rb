class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex-rs'
  version '0.1.4'
  url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.4/pihex_v0.1.4_darwin_amd64.zip'
  sha256 '4a0bd66a932df6d2c99e446859632963f78bfde8a51772ecd8be797c7005cd8e'

  def install
    bin.install 'pihex'
    zsh_completion.install "_pihex"
  end

  test do
    system "#{bin}/pihex", '--version'
  end
end
