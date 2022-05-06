class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.2.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.1/gojo_v0.2.1_darwin_arm64.zip'
      sha256 '6ce90879c8dd2298182d0e9950bc755a9bac6108488912da4904ea262965f31f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.1/gojo_v0.2.1_darwin_amd64.zip'
      sha256 '6fcacf1962876369f9fe9d4afbfcb7825283206058396f40e02060f6eb427126'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.1/gojo_v0.2.1_linux_arm64.tar.gz'
      sha256 '0541d57ebcf984fc3ef1976cfb7f07ff366eb69fc5ddff8a5be1471000e50abd'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.1/gojo_v0.2.1_linux_amd64.tar.gz'
      sha256 'a021663e8d1c4009958abca1a444eb7ae867a86453c865ed3915623a5ce58385'
    end
  end

  head do
    url 'https://github.com/itchyny/gojo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojo'
    zsh_completion.install "_gojo"
  end

  test do
    system "#{bin}/gojo", '-v'
  end
end
