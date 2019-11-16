class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.5'
  url 'https://github.com/itchyny/maze/releases/download/v0.0.5/maze_v0.0.5_darwin_amd64.zip'
  sha256 'a424ef0f090f3f1e7f335894e7b61956d4c01dc15330576523a5caf3dc8c32f2'

  head do
    url 'https://github.com/itchyny/maze.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maze'
  end

  test do
    system "#{bin}/maze", '--version'
  end
end
