class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.4'
  url 'https://github.com/itchyny/maze/releases/download/v0.0.4/maze_v0.0.4_darwin_amd64.zip'
  sha256 'dcf448cd0d98dec5c03ddfd4e0fb163ecfc2ee6f4e92fe8595b7635c41065c2c'

  head do
    url 'https://github.com/itchyny/maze.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/maze'
    else
      bin.install 'maze'
    end
  end

  test do
    system "#{bin}/maze", '--version'
  end
end
