class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.1.1'

  if OS.mac?
    url 'https://github.com/itchyny/gojo/releases/download/v0.1.1/gojo_v0.1.1_darwin_amd64.zip'
    sha256 '762015808efee6af28133c545d1e6058c018eca9fcee379a0033a2b3370dec70'
  elsif OS.linux?
    url 'https://github.com/itchyny/gojo/releases/download/v0.1.1/gojo_v0.1.1_linux_amd64.tar.gz'
    sha256 '06174e2c8efc3bf0372a4a7402a8f9ea509e9cd60257c553453aafbb025cf65f'
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
