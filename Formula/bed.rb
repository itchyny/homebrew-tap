class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.5'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.5/bed_v0.2.5_darwin_arm64.zip'
      sha256 'bf8b3d315d8cce05a12e891bdcd5932d9625ef69527e8c20cac4c79f05cc066e'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.5/bed_v0.2.5_darwin_amd64.zip'
      sha256 '295fe46de3db805fbfc60e1fa2a29f122483db809233caede44873d10b652ad9'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.5/bed_v0.2.5_linux_arm64.tar.gz'
      sha256 '1b5e81b984f702ee081b36be4f1435d41e3877db3d21961dba7b9c6035d226d0'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.5/bed_v0.2.5_linux_amd64.tar.gz'
      sha256 '470fdb83f001f6de97e77174e5de936a4936a8f6b021f9502fe51b4e5683c508'
    end
  end

  head do
    url 'https://github.com/itchyny/bed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'bed'
  end

  test do
    system "#{bin}/bed", '--version'
  end
end
