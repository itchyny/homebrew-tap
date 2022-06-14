class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.1.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.0/maketen_v0.1.0_darwin_arm64.zip'
      sha256 'f911cfbc156435dd0643d93cc897be2cb9d2c0f8e1dc532f2980679395f25b63'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.0/maketen_v0.1.0_darwin_amd64.zip'
      sha256 'd76df7b4be76e424fd60a3f8a37e765d01a4487fb9c382272dd9a62e25a43a52'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.0/maketen_v0.1.0_linux_arm64.tar.gz'
      sha256 '0a4ddf389ef24fcdc5aa413dfd663d03a60faa2ade3c4751870c7a30b5e0fe70'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maketen-go/releases/download/v0.1.0/maketen_v0.1.0_linux_amd64.tar.gz'
      sha256 '932f7557d4c98a14105514bdc2daaf1b545104942da46bb39b87f5bd91b0bbc5'
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
