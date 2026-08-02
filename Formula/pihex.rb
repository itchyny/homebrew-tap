class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex'
  version '0.1.9'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.9/pihex_v0.1.9_darwin_arm64.zip'
      sha256 '5bde0ea72728fbe28a4d8c6a9c81cfd35b4f2b2c1b9952d92cfe7d3463ebbc4d'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.9/pihex_v0.1.9_darwin_amd64.zip'
      sha256 '83ee97efa2eb9244ab46d583758d470adce6ba88efa3ffb46aa912dde596e424'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.9/pihex_v0.1.9_linux_arm64.zip'
      sha256 'ba170b156627a926c8e2bc0006c93cdbbc450da23e7ddc7c4274a4d686bbeba6'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/pihex/releases/download/v0.1.9/pihex_v0.1.9_linux_amd64.zip'
      sha256 'de6c6f3808c46ff4b59180d67d6e2ebd65b0a42536b957ac03f5a423ecd75ae7'
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
