class Log2hex < Formula
  homepage 'https://github.com/itchyny/log2hex'
  version '0.1.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.2/log2hex_v0.1.2_darwin_arm64.zip'
      sha256 '2c1fa715bd019e59cfd34de90b04af56ac101ff7f67012af75e1f0ca3f95e30d'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.2/log2hex_v0.1.2_darwin_amd64.zip'
      sha256 '87be76e458c45345ab4027b83ba6e2d3a1a9ac9b266a7cad0823783534360ccb'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.2/log2hex_v0.1.2_linux_arm64.zip'
      sha256 'ae3eb56b5d981ac0b60ae5182edbb44a15d0aedc6a7d38ecaa7043f798113e91'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.2/log2hex_v0.1.2_linux_amd64.zip'
      sha256 '37d6e016f471875d7a56e0bb55383ace2268f44b6fbe311f7ca8b1774df9e1e3'
    end
  end

  head do
    url 'https://github.com/itchyny/log2hex.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'log2hex'
    end
    zsh_completion.install "_log2hex"
  end

  test do
    system "#{bin}/log2hex"
  end
end
