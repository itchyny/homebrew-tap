class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.5'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.5/miv_v0.4.5_darwin_amd64.zip'
    sha256 '67e3a6243fdb7db4b822f9f0be474f897d731d1a95915b8fd9a51847838e3e43'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.5/miv_v0.4.5_linux_amd64.zip'
    sha256 'd68991c9d7d235946934a90278243b8d0502bf8e462009942050689c10434731'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
