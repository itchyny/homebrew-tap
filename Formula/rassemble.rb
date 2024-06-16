class Rassemble < Formula
  homepage 'https://github.com/itchyny/rassemble-go'
  version '0.1.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.2/rassemble_v0.1.2_darwin_arm64.zip'
      sha256 '86e68f4c38599b849f71cf28e83204383c14a1e619c95e8b4bbcff04a409fddc'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.2/rassemble_v0.1.2_darwin_amd64.zip'
      sha256 '9dd80b390b425f157d07ea7c8b1aab83a13ddf28bfb76fbef5fe265ec46d3930'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.2/rassemble_v0.1.2_linux_arm64.tar.gz'
      sha256 '340b16496f701afbce0be9530dcecf73aea57083a710d75d2f26c0e1b7f7c011'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.2/rassemble_v0.1.2_linux_amd64.tar.gz'
      sha256 '5764f03d24b4ac3bde9e0eab9d58733626f14df9536fc3f97c4e869680b92c84'
    end
  end

  head do
    url 'https://github.com/itchyny/rassemble-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rassemble'
  end

  test do
    system "#{bin}/rassemble", '-version'
  end
end
