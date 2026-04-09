class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.2.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.3/base58_v0.2.3_darwin_arm64.zip'
      sha256 'fd86c5b218d1190bbb6f54b35bd66476d0ed762f0736d93c5684e45329cc98ea'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.3/base58_v0.2.3_darwin_amd64.zip'
      sha256 '13cb6ff3d618b607ce50867bd3bf3a78f4165321117c438c1173b90d86920e44'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.3/base58_v0.2.3_linux_arm64.tar.gz'
      sha256 '7bd956fbeac376a92ed2a0e26cc8353ded865fa633080bdd4961886a10d34f0b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.3/base58_v0.2.3_linux_amd64.tar.gz'
      sha256 'b8de723502b332de652386292eddf4d5391820979e094155ede4c20e7ce93050'
    end
  end

  head do
    url 'https://github.com/itchyny/base58-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    else
    end
    bin.install 'base58'
    zsh_completion.install "_base58"
  end

  test do
    system "#{bin}/base58", '--version'
  end
end
