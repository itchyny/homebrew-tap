class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.3.1'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.1/qhs_v0.3.1_darwin_amd64.zip'
    sha256 '156e79e7a3f5ac36c5dc92658753b2e7a0b98c08c720813d041b9c99fea55908'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.1/qhs_v0.3.1_linux_amd64.zip'
    sha256 '84c13010f7beac939f6d742a8aa40cf654078200f313f144cac1191acdec87ad'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
