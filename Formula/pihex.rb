class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex'
  version '0.1.7'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.7/pihex_v0.1.7_darwin_arm64.zip'
      sha256 '8582bd5714275e9bfed2b6feb074687930048d56937a2c11e51f6c14b38f007f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.7/pihex_v0.1.7_darwin_amd64.zip'
      sha256 'b823d60e705ea86057dbe38a9e5d73df48b4e44ea539b2f0d56532a24d3f89ed'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.7/pihex_v0.1.7_linux_arm64.zip'
      sha256 '0522b9a5abad43af3d16a61aa84d28d747c8559966399e842c27523c87c1f5ad'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.7/pihex_v0.1.7_linux_amd64.zip'
      sha256 'a735264bcb7a66340a482d853678dd328a67bd3b5428c7b05c9ed9fb42133314'
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
