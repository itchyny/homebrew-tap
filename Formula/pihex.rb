class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex'
  version '0.1.6'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.6/pihex_v0.1.6_darwin_arm64.zip'
      sha256 'def2fdfc39c7b14aaa0fdb5ea0634f488e3e8a4595d20f3eed2f84e1268051a6'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.6/pihex_v0.1.6_darwin_amd64.zip'
      sha256 '15286f28d6855807d8030ef3dbd54fb856dfc561288e25adbe8b2ee374eb89b5'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.6/pihex_v0.1.6_linux_arm64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.6/pihex_v0.1.6_linux_amd64.tar.gz'
      sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
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
