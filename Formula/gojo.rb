class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.1.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.1.3/gojo_v0.1.3_darwin_arm64.zip'
      sha256 '65a49f795ba18241fb9ba136a8f7f862b6a7391507c84d7e1ab087348b5d1848'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.1.3/gojo_v0.1.3_darwin_amd64.zip'
      sha256 'a194d5c983326eca3ff286adfb4cc660cb753a74d97812ccba4acd25bfe598c6'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.1.3/gojo_v0.1.3_linux_arm64.tar.gz'
      sha256 'c6254e200ecb1adc47407c47a6bb12b1a048cb4835d7b4664c119953573170cd'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.1.3/gojo_v0.1.3_linux_amd64.tar.gz'
      sha256 '3ffd927d277bce2979b051a121cfb0a2d0c350fd795b09dfb9cc8d49ec6e115d'
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
