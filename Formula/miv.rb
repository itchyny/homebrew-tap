class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.6'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.6/miv_v0.4.6_darwin_amd64.zip'
    sha256 '4623893e655a03aa8410a4ee91e87bc0ee6e438a0f170512aa82246bfab6d87e'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.6/miv_v0.4.6_linux_amd64.zip'
    sha256 'd96b89a8efd550ca0fb7541920bac1f7b15e5c04e39908fff5f18754d2af9f57'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
