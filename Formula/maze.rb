class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.9'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.9/maze_v0.0.9_darwin_arm64.zip'
      sha256 'e992bfcdab40204e88597a3b92cb6b7338729df69531cde5d5d07f9439b57f77'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.9/maze_v0.0.9_darwin_amd64.zip'
      sha256 'ab368da90e1f9764268991efbb2129e81e3bb926069ebb923d4634bc01353267'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.9/maze_v0.0.9_linux_arm64.tar.gz'
      sha256 '31967576a205b859effda16fd32d06111c3928242e502dfea6566ac1dc043f37'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.9/maze_v0.0.9_linux_amd64.tar.gz'
      sha256 '4b47c8f687889f8567b8ee1e96fc20c89870f5a50914cb3545a5a511c1c7cee6'
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
