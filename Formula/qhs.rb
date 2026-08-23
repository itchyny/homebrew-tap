class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.4.4'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.4/qhs_v0.4.4_darwin_arm64.zip'
    sha256 '37810ae29614944377c6eeddd8b43ef23e11272bd553eae6674fdae69e872314'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.4/qhs_v0.4.4_linux_amd64.zip'
    sha256 '8734dd8bfc613445479b3fd1f49cc2cc8f8508a662a28c12be4c132324878add'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
