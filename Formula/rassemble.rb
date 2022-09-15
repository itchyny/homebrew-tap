class Rassemble < Formula
  homepage 'https://github.com/itchyny/rassemble-go'
  version '0.1.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.0/rassemble_v0.1.0_darwin_arm64.zip'
      sha256 '60f7f75734df9ad8670052e2335e1d6967ff4efcdb7dc43475a4e563d98b8564'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.0/rassemble_v0.1.0_darwin_amd64.zip'
      sha256 '8ef8fc02ad914147fecc55dbe8a52edc76c341dd96fe00cd2577506f43ba864c'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.0/rassemble_v0.1.0_linux_arm64.tar.gz'
      sha256 'ed26f60ee3a865302c3cd5ae02c200534b22381f0d418786ca029299110cf40c'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/rassemble-go/releases/download/v0.1.0/rassemble_v0.1.0_linux_amd64.tar.gz'
      sha256 '13805e9c1b3af64e58d42b0d1226b57be8dfddb2775f3a10553391404b3ddb41'
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
