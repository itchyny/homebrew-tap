class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.2.4'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.4/bed_v0.2.4_darwin_arm64.zip'
      sha256 '4b1bf9cc34fbea9a1fae704bb2e0c383455185409f56d8955b581505614ff342'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.4/bed_v0.2.4_darwin_amd64.zip'
      sha256 '9471e4dc157c885e5a6365d611f76380f2756e68277bd2280171a3c755a59b6a'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.4/bed_v0.2.4_linux_arm64.tar.gz'
      sha256 'a5f74bb5d2bb5f2612daa44b9d8fc1da0ce953c730ad862a4bb840156fcae45a'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/bed/releases/download/v0.2.4/bed_v0.2.4_linux_amd64.tar.gz'
      sha256 '9c2c855bc80ebf9d52953213a47131be49098f51bd6f3397bfccac8824827faa'
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
