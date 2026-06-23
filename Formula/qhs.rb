class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.4.3'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.3/qhs_v0.4.3_darwin_arm64.zip'
    sha256 'aa938fb4df725581d1a207a9a57e235df45aec99822e9ced432f6760b90bfec9'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.3/qhs_v0.4.3_linux_amd64.zip'
    sha256 'c69b2ed60d735169aa8ffa3c6c7ae4520393959b7312a70363566ab88492419a'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
