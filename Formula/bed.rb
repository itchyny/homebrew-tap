class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.1'

  if OS.mac?
    url 'https://github.com/itchyny/bed/releases/download/v0.2.1/bed_v0.2.1_darwin_amd64.zip'
    sha256 'eb757353cd95cc8d57c71a646ddb9381d9720dc61c315c9d78a91b3cd994617a'
  elsif OS.linux?
    url 'https://github.com/itchyny/bed/releases/download/v0.2.1/bed_v0.2.1_linux_amd64.tar.gz'
    sha256 'b18e55cb6c09c9bb88ea41ec682854709bf8fb082c2318e0b57093bb16fda7ba'
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
