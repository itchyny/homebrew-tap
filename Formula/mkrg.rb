class Mkrg < Formula
  homepage 'https://github.com/itchyny/mkrg'
  version '0.0.3'
  url 'https://github.com/itchyny/mkrg/releases/download/v0.0.3/mkrg_v0.0.3_darwin_amd64.zip'
  sha256 'be706420118e88d20bae924977aa72c1fe09f7fada362c1c904859733574acb0'

  head do
    url 'https://github.com/itchyny/mkrg.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mkrg'
  end

  test do
    system "#{bin}/mkrg", '--version'
  end
end
