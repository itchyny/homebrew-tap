class GitBranchName < Formula
  homepage 'https://github.com/itchyny/git-branch-name'
  version '0.0.2'
  url 'https://github.com/itchyny/git-branch-name/archive/v0.0.2.zip'
  sha256 '5e8fbd121b8b25ae64017b61f50c2a57f07abc4627a3b6b01b505a4f78b72dad'
  head 'https://github.com/itchyny/git-branch-name.git'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/git-branch-name"
  end
end
