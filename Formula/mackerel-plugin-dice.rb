class MackerelPluginDice < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-dice'
  version '0.0.0'
  url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.0.0/mackerel-plugin-dice.zip'
  sha256 '4ecc30fa38779eb1363dc7111d41a50656b44badfa17fffdcfe57d5c4ebf104a'
  head 'https://github.com/itchyny/mackerel-plugin-dice.git'

  def install
    bin.install 'mackerel-plugin-dice'
  end

  test do
    system "#{bin}/mackerel-plugin-dice"
  end
end
