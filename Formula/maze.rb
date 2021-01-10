class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.7'

  if OS.mac?
    url 'https://github.com/itchyny/maze/releases/download/v0.0.7/maze_v0.0.7_darwin_amd64.zip'
    sha256 '85fe35ce9191534753e51eaefadda5efd033ec3d13817a9aa6fd9d11b9d6970b'
  elsif OS.linux?
    url 'https://github.com/itchyny/maze/releases/download/v0.0.7/maze_v0.0.7_linux_amd64.tar.gz'
    sha256 '1c63958b58af2901e61ca946a827a2832f91e3f99b9cc0e4cb47b68b6c29e208'
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
