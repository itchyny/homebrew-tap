class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.6'
  url 'https://github.com/itchyny/maze/releases/download/v0.0.6/maze_v0.0.6_darwin_amd64.zip'
  sha256 'cc26db0a82cfe6d4f3a0c112f36e5402dc590f5858b2339e91bd0d00e864e333'

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
