class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.3.1'

  if OS.mac?
    url 'https://github.com/itchyny/rexdep/releases/download/v0.3.1/rexdep_v0.3.1_darwin_amd64.zip'
    sha256 '3194c9dc0a3f6fe9ed74e7242b364d2226d29deb6aaa6fffe2b61f2ccc018ada'
  elsif OS.linux?
    url 'https://github.com/itchyny/rexdep/releases/download/v0.3.1/rexdep_v0.3.1_linux_amd64.tar.gz'
    sha256 '85d8b52d670c925250ab5dcfc41861edd573c605eb4199a5fdd3985cc6fd653d'
  end

  head do
    url 'https://github.com/itchyny/rexdep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rexdep'
  end

  test do
    system "#{bin}/rexdep", '--version'
  end
end
