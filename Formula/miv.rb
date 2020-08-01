class Miv < Formula
  homepage 'https://github.com/itchyny/miv'
  version '0.4.2'

  if OS.mac?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.2/miv_v0.4.2_darwin_amd64.zip'
    sha256 'bb47e4e49fec39e5ff813a1cc0e31cad51adef9339063aab6a27a7c353316957'
  elsif OS.linux?
    url 'https://github.com/itchyny/miv/releases/download/v0.4.2/miv_v0.4.2_linux_amd64.zip'
    sha256 '24b8b4a5755fd85139544faae74cf71f0c5b9671147505e5ddd693a67108216f'
  end

  def install
    bin.install 'miv'
    zsh_completion.install "_miv"
  end

  test do
    system "#{bin}/miv", '--version'
  end
end
