class Mkrg < Formula
  homepage 'https://github.com/itchyny/mkrg'
  version '0.0.4'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mkrg/releases/download/v0.0.4/mkrg_v0.0.4_darwin_arm64.zip'
      sha256 'e62ff83bbe2ea9d229a05fccfcbbfe29deead68b2bbf2a49461dce648122ca29'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mkrg/releases/download/v0.0.4/mkrg_v0.0.4_darwin_amd64.zip'
      sha256 'bc1f768c147e16d2604ffefed9a4861dbfbc8dc07aea665139d26c75244df1c0'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mkrg/releases/download/v0.0.4/mkrg_v0.0.4_linux_arm64.tar.gz'
      sha256 '2b5e08679c75a2c645b1a68dbed484d3735ca220da891af09af28f20ec816f3f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mkrg/releases/download/v0.0.4/mkrg_v0.0.4_linux_amd64.tar.gz'
      sha256 '397360fb45e087e7d424a5817a664be2148dc69baa5c72b5651f7c87c1fb6ec5'
    end
  end

  head do
    url 'https://github.com/itchyny/mkrg.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mkrg'
  end

  test do
    system "#{bin}/mkrg", '--version'
  end
end
