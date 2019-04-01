class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.4'
  url 'https://github.com/itchyny/formulate/archive/v0.0.4.zip'
  sha256 'b53cc1c438960d272d6fe7f22c845fdd03724f90adfe41a74fc814b557d90e83'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
