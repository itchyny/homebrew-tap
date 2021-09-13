class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.2/bed_v0.2.2_darwin_arm64.zip'
      sha256 '2bf085056c7202e9e7471f21caebd079dd9ae71fc990ab62c205cf08d3e67e2a'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.2/bed_v0.2.2_darwin_amd64.zip'
      sha256 '5cbeae74fe7544539afce1d64ffb665cc6bc150f2c07c1a10135de7cd6e982bc'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.2/bed_v0.2.2_linux_arm64.tar.gz'
      sha256 'e3311d6c75d45d0a6d4b18bc9dc21c6405ca87fcb2d6748c6f5f011a9e341c6b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.2/bed_v0.2.2_linux_amd64.tar.gz'
      sha256 '855246c7246273f7c63b1f662f2985ce4a80c74ecb188534f456ba04dda4c4a0'
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
