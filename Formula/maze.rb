class Maze < Formula
  homepage 'https://github.com/itchyny/maze'
  version '0.0.10'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.10/maze_v0.0.10_darwin_arm64.zip'
      sha256 '5204f4867480cdd19380fe47a9d82281180bfe76c1cb4a21197edad346c74006'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.10/maze_v0.0.10_darwin_amd64.zip'
      sha256 '57f545cc4e63617cf58f68cf21fe8b14f2a2f70ab8fb6b5bece7fc029f4a1a57'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.10/maze_v0.0.10_linux_arm64.tar.gz'
      sha256 '1ea033419afd3feb9d9884e94d08e2f14cc2da3b554959007c3ac9c2c9580b7f'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/maze/releases/download/v0.0.10/maze_v0.0.10_linux_amd64.tar.gz'
      sha256 'c5bfae5a724271a6c20963f118078b77632cd746977dbc7cae148d9c3a3bfe91'
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
