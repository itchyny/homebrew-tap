class Volume < Formula
  homepage 'https://github.com/itchyny/volume-go'
  version '0.2.3'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.3/volume_v0.2.3_darwin_arm64.zip'
      sha256 '21adb087d77d759bef0c4eb6cd344f6b2027bf3f411e3ee0df4f78db035380dc'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.3/volume_v0.2.3_darwin_amd64.zip'
      sha256 'd22d7a22434af2e7781bc375e367afdd2ba8df26d992382d684519af684dbb38'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.3/volume_v0.2.3_linux_arm64.tar.gz'
      sha256 '9fce773d3cf0ee8f0286df2a348f93538f873c4afe58acea1575e38edf28c72b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/volume-go/releases/download/v0.2.3/volume_v0.2.3_linux_amd64.tar.gz'
      sha256 '56c8ae2ea8db97d28fd0bd25b663f66b4333d5b19a50a4296e52c3d87a006ffb'
    end
  end

  head do
    url 'https://github.com/itchyny/volume-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'volume'
  end

  test do
    system "#{bin}/volume", '--version'
  end
end
