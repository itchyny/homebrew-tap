class Rassemble < Formula
  homepage 'https://github.com/itchyny/rassemble-go'
  version '0.1.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.3/rassemble_v0.1.3_darwin_arm64.zip'
      sha256 '2bd8a0aea6c6f56ffc0899ab3595dd290471e953430de3a916e714d4602d746b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.3/rassemble_v0.1.3_darwin_amd64.zip'
      sha256 '8f7bd54360e510c7cbb467ed5e140cab6c52cf9b17862c7d56951a7769ebc1a1'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.3/rassemble_v0.1.3_linux_arm64.tar.gz'
      sha256 '8fc40c2719e75b4d801b3d63765c4ac10ebafedec8e23d1fbbf9e0900b600fd7'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.3/rassemble_v0.1.3_linux_amd64.tar.gz'
      sha256 'a3a34d857ac2955642b1c51677c867b56e8598f130c4c6e0c9d541765220571e'
    end
  end

  head do
    url 'https://github.com/itchyny/rassemble-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rassemble'
  end

  test do
    system "#{bin}/rassemble", '-version'
  end
end
