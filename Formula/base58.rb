class Base58 < Formula
  homepage 'https://github.com/itchyny/base58-go'
  version '0.1.0'

  if OS.mac?
    url 'https://github.com/itchyny/base58-go/releases/download/v0.1.0/base58_v0.1.0_darwin_amd64.zip'
    sha256 '00ad288f57847c58f405782143841827ff6ec189da5ece6a86b268095dac9d90'
  elsif OS.linux?
    url 'https://github.com/itchyny/base58-go/releases/download/v0.1.0/base58_v0.1.0_linux_amd64.tar.gz'
    sha256 '40e09af4e211da6fa0ec95f762d020fceec3dfd5cbf7e54e5a2ddb8ced412816'
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
