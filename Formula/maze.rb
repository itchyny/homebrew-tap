class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.11'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.11/maze_v0.0.11_darwin_arm64.zip'
      sha256 '01e71100c035f3637a92bd3660bfc5eb8ecbe79c5f647657486b943948260531'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.11/maze_v0.0.11_darwin_amd64.zip'
      sha256 'a302cbafea88b7451e58381a83ec0137b40743c60318d7aba7b581ca3d86c9e6'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.11/maze_v0.0.11_linux_arm64.tar.gz'
      sha256 '3c5272e7fb9b19cc2724b7ca0992868e58b28b5856b43eaa6aaab24873ea0782'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.11/maze_v0.0.11_linux_amd64.tar.gz'
      sha256 'ad80ff74249d019fbfd58f373864d41936f1f2bad206308789d07c7d34634794'
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
