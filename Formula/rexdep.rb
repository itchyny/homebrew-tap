class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.2.0'
  url 'https://github.com/itchyny/rexdep/releases/download/v0.2.0/rexdep_v0.2.0_darwin_amd64.zip'
  sha256 '6a670a90d5a7e63d766c96e0bfd38212130eaeccd7c49a0d291af2ea58a38106'

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
