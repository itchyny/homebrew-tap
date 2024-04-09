class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex'
  version '0.1.8'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.8/pihex_v0.1.8_darwin_arm64.zip'
      sha256 '864bcdf8079d9af861ec1d44b7b6a1a6192fe92acaddf8d6afee5a7f6ec44098'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.8/pihex_v0.1.8_darwin_amd64.zip'
      sha256 'f2246be833eb70225f8d43953f85f5aedc61fb22a8c94ddc71e3a37d7c6c8978'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.8/pihex_v0.1.8_linux_arm64.zip'
      sha256 'c129e0a2a689ca39b41730a5d5f35700ac7eb8354f51281d474f1658c1b99c16'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.8/pihex_v0.1.8_linux_amd64.zip'
      sha256 '35d5fc30087237ab8564cfb94d4ed05024a6e86ebb6cd0c0fcf2c6031a99aeb8'
    end
  end

  head do
    url 'https://github.com/itchyny/pihex.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'pihex'
    end
    zsh_completion.install "_pihex"
  end

  test do
    system "#{bin}/pihex"
  end
end
