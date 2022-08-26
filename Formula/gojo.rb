class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.3.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.0/gojo_v0.3.0_darwin_arm64.zip'
      sha256 '9a1793e48c16469b2d23dd84530de64a147c407e6079e550030afd2e0ad2ea4f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.0/gojo_v0.3.0_darwin_amd64.zip'
      sha256 '9d2370aa2e06bd28f8a66412d20bc9f7d4b0effe14d57eef6b292e57483328e8'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.0/gojo_v0.3.0_linux_arm64.tar.gz'
      sha256 '904b6280703bbe2b5645f4c18d0d5821e22e3a806b2aafd6613b85550f70eb35'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.0/gojo_v0.3.0_linux_amd64.tar.gz'
      sha256 '1068c51a5266109dc66abd5f2dd17613d2a1ebc9e88935c26acb84023778fa72'
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
