class Fillin < Formula
  homepage 'https://github.com/itchyny/fillin'
  version '0.3.2'

  if OS.mac?
    url 'https://github.com/itchyny/fillin/releases/download/v0.3.2/fillin_v0.3.2_darwin_amd64.zip'
    sha256 '72e0dab9b213350c627a8701dda62eca6b8a90bafde8ce0d4c525fbf7d98e441'
  elsif OS.linux?
    url 'https://github.com/itchyny/fillin/releases/download/v0.3.2/fillin_v0.3.2_linux_amd64.tar.gz'
    sha256 'b093b2d720773963c394a81a803c013c13130e824cbf82efd336a01529a5b5fb'
  end

  head do
    url 'https://github.com/itchyny/fillin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'fillin'
  end

  test do
    system "#{bin}/fillin", '--version'
  end
end
