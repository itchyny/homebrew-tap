class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.1.0'
  url 'https://github.com/itchyny/rexdep/releases/download/v0.1.0/rexdep_darwin_amd64.zip'
  sha256 'b32a10c655999a74860a0b36a62185958e351dff2d132f8c9f2ca67b5a207b45'

  head do
    url 'https://github.com/itchyny/rexdep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/rexdep'
    else
      bin.install 'rexdep'
    end
  end

  test do
    system "#{bin}/rexdep", '--version'
  end
end
