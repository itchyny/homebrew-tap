class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.3/bed_v0.2.3_darwin_arm64.zip'
      sha256 'bcb6d7acb90e1e01f95b17fbd65c67543ac1e8b910b38b81b9376fa7669987d4'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.3/bed_v0.2.3_darwin_amd64.zip'
      sha256 'df15d98f338f1bfb91785365481b7092347ad93797d8eeb14a585e830a146ba8'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.3/bed_v0.2.3_linux_arm64.tar.gz'
      sha256 'f589a13ca002494afadb53c2e510f49bcf5b24d254446aad0bd2681e17d8bcc3'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.3/bed_v0.2.3_linux_amd64.tar.gz'
      sha256 '2cfc953fb8e4ed958905ace217aaa4c4b10df2b00ab62d7613b908ea429d4666'
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
