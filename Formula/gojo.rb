class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.2.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.0/gojo_v0.2.0_darwin_arm64.zip'
      sha256 'be9d8ac202d77b693b4792d5ebcd45a69639bbba0ae95806599fd05dfa3df7c6'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.0/gojo_v0.2.0_darwin_amd64.zip'
      sha256 'cc4bdadc0e879460d0685d50feb278a49357a2d1c64acfbf9f610445027e7c8a'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.0/gojo_v0.2.0_linux_arm64.tar.gz'
      sha256 '8dd82ca383504660a8607d07709764e3c729c9d1b30a8b8b41a4c74211a70e16'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.2.0/gojo_v0.2.0_linux_amd64.tar.gz'
      sha256 'd16efe2f5eb3b18fd5b671e32ae41d7a2b8c922dd92e8cb9fd774cd029055169'
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
