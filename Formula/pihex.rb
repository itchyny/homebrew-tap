class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex'
  version '0.1.10'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.10/pihex-v0.1.10-aarch64-apple-darwin.zip'
      sha256 '692cc59b4b4feb4cc81840b3c2018614e168ee10e6e3347787ae7bafa531f2ae'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.10/pihex-v0.1.10-x86_64-apple-darwin.zip'
      sha256 '39fa71ad863f0903fe51faf69add14756f643179a69719a6b872f38ba5853fb5'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.10/pihex-v0.1.10-aarch64-unknown-linux-musl.zip'
      sha256 '9debb03027c5a8f15d1043e46a68accab0df97bde3bf1d173e75883ea1bad578'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.10/pihex-v0.1.10-x86_64-unknown-linux-musl.zip'
      sha256 '99cddb19d0ab0b65f5bdbd196c0bd70940d978581ab1ec52f5d30d40f3c03b88'
    end
  end

  head do
    url 'https://github.com/itchyny/pihex.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'pihex'
    end
    zsh_completion.install "_pihex"
  end

  test do
    system "#{bin}/pihex"
  end
end
