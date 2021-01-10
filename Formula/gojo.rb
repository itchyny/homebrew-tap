class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.1.2'

  if OS.mac?
    url 'https://github.com/itchyny/gojo/releases/download/v0.1.2/gojo_v0.1.2_darwin_amd64.zip'
    sha256 '62b4ca1aaa2fa92be553535f7700a18ab597e06322569473c1846e51f26fd0af'
  elsif OS.linux?
    url 'https://github.com/itchyny/gojo/releases/download/v0.1.2/gojo_v0.1.2_linux_amd64.tar.gz'
    sha256 'aebd7a490e93ef76486fe48e5cbc7ee2a504ffcb7899bdd0bc6591d4c03c74ef'
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
