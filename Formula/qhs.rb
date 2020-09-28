class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.3.2'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.2/qhs_v0.3.2_darwin_amd64.zip'
    sha256 '14d27415989c92a383d981142cf98899f0fdcbcc8b63dbc99ad90b9b51892df8'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.2/qhs_v0.3.2_linux_amd64.zip'
    sha256 '311a1ee49a68d3dbf29c7a9eda4f7400f3285718b9d7943e99efd7072189733d'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
