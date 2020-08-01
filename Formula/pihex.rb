class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex-rs'
  version '0.1.4'

  if OS.mac?
    url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.4/pihex_v0.1.4_darwin_amd64.zip'
    sha256 '4a0bd66a932df6d2c99e446859632963f78bfde8a51772ecd8be797c7005cd8e'
  elsif OS.linux?
    url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.4/pihex_v0.1.4_linux_amd64.zip'
    sha256 '6972f519f0489e82c4426c4a1b85af21282de116fd4d75f4ba68ba5981c56074'
  end

  def install
    bin.install 'pihex'
    zsh_completion.install "_pihex"
  end

  test do
    system "#{bin}/pihex", '--version'
  end
end
