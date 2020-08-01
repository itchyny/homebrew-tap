class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.6'

  if OS.mac?
    url 'https://github.com/itchyny/maze/releases/download/v0.0.6/maze_v0.0.6_darwin_amd64.zip'
    sha256 'cc26db0a82cfe6d4f3a0c112f36e5402dc590f5858b2339e91bd0d00e864e333'
  elsif OS.linux?
    url 'https://github.com/itchyny/maze/releases/download/v0.0.6/maze_v0.0.6_linux_amd64.tar.gz'
    sha256 'f545565f881e370ab1f4b26c9f7002095345c9a6947888a628c365d6fe0cc8f2'
  end

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
