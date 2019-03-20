class GitBranchName < Formula
  homepage 'https://github.com/itchyny/git-branch-name'
  version '0.0.1'
  url 'https://github.com/itchyny/git-branch-name/archive/v0.0.1.zip'
  sha256 '806e71e0d6365af46e65e9eb975f75e11fa8bedcd17c4996bcad40b2ae20356c'
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
