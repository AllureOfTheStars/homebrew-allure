require "language/haskell"

class Allureofthestars < Formula
  include Language::Haskell::Cabal

  desc "Near-future Sci-Fi roguelike and tactical squad combat game"
  homepage "https://www.allureofthestars.com/"
  url "https://hackage.haskell.org/package/Allure-0.10.2.0/Allure-0.10.2.0.tar.gz"
  sha256 ""
  head "https://github.com/AllureOfTheStars/Allure.git"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2_ttf"

  def install
    install_cabal_package :using => ["happy", "alex"]
  end

  test do
    play_args = "--maxFps 100000 --stopAfterFrames 50 --automateAll --keepAutomated"
    misc_args = "--logPriority 0 --newGame 3 --gameMode battle --setDungeonRng \"SMGen 7 7\" --setMainRng \"SMGen 7 7\""
    output = shell_output("#{bin}/Allure --dbgMsgSer --dbgMsgCli #{play_args} #{misc_args}")
    assert_equal "", output
    assert_equal "", shell_output("cat ~/.Allure/stderr.txt")
    assert_match "Client FactionId 1 closed frontend.", shell_output("cat ~/.Allure/stdout.txt")
  end
end
