class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.1.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.2/maketen_v0.1.2_darwin_arm64.zip'
      sha256 '615d110beee8ce86b68bb44ecd4b4fe1a99296353788a45b2f15d517bc562fbc'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.2/maketen_v0.1.2_darwin_amd64.zip'
      sha256 'd8a45cb9ef549d85a1e876237006e8854fd97f965c6d1fbafa6c9d1e9d2e48b1'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.2/maketen_v0.1.2_linux_arm64.tar.gz'
      sha256 '2f3fb9ad36b5a079b5ebf06a7e3a1b775206ec2eff1279c1850124a7d50533ab'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.2/maketen_v0.1.2_linux_amd64.tar.gz'
      sha256 'd6461ef1a4c94c2b2e3037cf97164f0e1cc692e5e970db85cbc09c1a451e0560'
    end
  end

  head do
    url 'https://github.com/itchyny/maketen-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maketen'
  end

  test do
    system "#{bin}/maketen", '-v'
  end
end
