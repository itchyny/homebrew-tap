class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex-rs'
  version '0.1.5'

  if OS.mac?
    url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.5/pihex_v0.1.5_darwin_amd64.zip'
    sha256 '345a3aacda0b4e8e27b100d132790b80bb8b62adee0ccfb0d0b872d173c5278d'
  elsif OS.linux?
    url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.5/pihex_v0.1.5_linux_amd64.zip'
    sha256 '8fb6065c0dfaa2f04a2ce14b24e12f0d793c25e9841808ba2fc2eb5f5ae47baa'
  end

  def install
    bin.install 'pihex'
    zsh_completion.install "_pihex"
  end

  test do
    system "#{bin}/pihex", '--version'
  end
end
