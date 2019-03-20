class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.3'
  url 'https://github.com/itchyny/maze/releases/download/v0.0.3/maze_darwin_amd64.zip'
  sha256 'cc952a9045796acda4234d12e5289bffd77299b151c69af2b5c95660965a328a'

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
