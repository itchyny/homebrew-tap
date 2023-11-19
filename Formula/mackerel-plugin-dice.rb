class MackerelPluginDice < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-dice'
  version '0.1.0'
  url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.1.0/mackerel-plugin-dice.zip'
  sha256 '3e38d106f7aaa3fee29e022d7d044c17907362c7694e5416ab4b5a1c87de71a7'
  head 'https://github.com/itchyny/mackerel-plugin-dice.git'

  def install
    bin.install 'mackerel-plugin-dice'
  end

  test do
    system "#{bin}/mackerel-plugin-dice"
  end
end
