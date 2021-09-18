class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.3.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rexdep/releases/download/v0.3.2/rexdep_v0.3.2_darwin_arm64.zip'
      sha256 '3b6e6738d12cf37d390f577a58ba9a54dca3c7e44925bf56be247b37f00e583d'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rexdep/releases/download/v0.3.2/rexdep_v0.3.2_darwin_amd64.zip'
      sha256 'dcde94fbf19bc84b22181c00f344360cc66b177105f3fb51f234223d85db9626'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rexdep/releases/download/v0.3.2/rexdep_v0.3.2_linux_arm64.tar.gz'
      sha256 'f88ea11bae0e739043478c882e6c75ba501697b017fe6122f18c64a599d2c7ba'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rexdep/releases/download/v0.3.2/rexdep_v0.3.2_linux_amd64.tar.gz'
      sha256 '2e0d0824a30ab09e5d11ded287851104523c1094deab3deee3e987820a984402'
    end
  end

  head do
    url 'https://github.com/itchyny/rexdep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rexdep'
  end

  test do
    system "#{bin}/rexdep", '--version'
  end
end
