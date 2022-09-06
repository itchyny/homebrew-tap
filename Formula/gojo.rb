class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.3.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.1/gojo_v0.3.1_darwin_arm64.zip'
      sha256 '24cff15d6c6839f2979068d521f690ac4b991064c00c198ff79ee0e9309d7aa0'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.1/gojo_v0.3.1_darwin_amd64.zip'
      sha256 'da18dc82146a70a83493cbeb856d6e0f81638db470838ef63f5a09601a70dbc6'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.1/gojo_v0.3.1_linux_arm64.tar.gz'
      sha256 '065fe39bcbe6ba0f360c88fb0ae59db16856757901e51ebc30a944b267452a19'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/gojo/releases/download/v0.3.1/gojo_v0.3.1_linux_amd64.tar.gz'
      sha256 '4642903e7b8ca722aef539d8c6943ce989906d77d7d5f0d35826005b6e0ad935'
    end
  end

  head do
    url 'https://github.com/itchyny/gojo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojo'
    zsh_completion.install "_gojo"
  end

  test do
    system "#{bin}/gojo", '-v'
  end
end
