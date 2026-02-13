class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.4.2'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.2/qhs_v0.4.2_darwin_arm64.zip'
    sha256 '525d4ca2f05c81916cc7888638b5041a0a6e2bbdc5c67a4c093739114069d9e6'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.2/qhs_v0.4.2_linux_amd64.zip'
    sha256 'c2a3845f4480068c1ffdce0eff07fb6d547a945277878f46fcf6928edc081f43'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
