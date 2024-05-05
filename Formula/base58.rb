class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.2.2'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.2/base58_v0.2.2_darwin_arm64.zip'
      sha256 '391f3eac8031d02048ccda26f80b9a3e12375faa9b633dbf71cf62eb2e835957'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.2/base58_v0.2.2_darwin_amd64.zip'
      sha256 '2e437c7876578a962fadeaf01b61ec1af2e3664fded85e50e1ac9a8c1013b8df'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.2/base58_v0.2.2_linux_arm64.tar.gz'
      sha256 '282e498a4b8c3401f3021c06ef8b75a80d8c6609f7ee838334ec264a8c85a0db'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/base58-go/releases/download/v0.2.2/base58_v0.2.2_linux_amd64.tar.gz'
      sha256 '13babd6949cc15e66b6d9af6e331816166024350add5ef91b0962bd2a29ade20'
    end
  end

  head do
    url 'https://github.com/itchyny/base58-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    else
    end
    bin.install 'base58'
    zsh_completion.install "_base58"
  end

  test do
    system "#{bin}/base58", '--version'
  end
end
