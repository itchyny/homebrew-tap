class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.8'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.8/maze_v0.0.8_darwin_arm64.zip'
      sha256 '8cba23dea3884c251791052830ea792afdefb59c0690f88c9d004341d22b5ddd'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.8/maze_v0.0.8_darwin_amd64.zip'
      sha256 'ed754ab828a1746ea5cb3cfacaf507acd2a9a3860e15c735f39ad33c922d0d78'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.8/maze_v0.0.8_linux_arm64.tar.gz'
      sha256 '66d8b42dd4844cf58d1f282576ada4557386a2b08a962ca2968c9b30a2f4cb49'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.8/maze_v0.0.8_linux_amd64.tar.gz'
      sha256 '90dfe45661c6dd5c5b6eabf2732a6c4f6329b3c0805175d1b06e1d262ca23938'
    end
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
