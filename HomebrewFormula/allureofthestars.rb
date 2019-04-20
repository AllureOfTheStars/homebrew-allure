require "language/haskell"

class Allureofthestars < Formula
  include Language::Haskell::Cabal

  desc "Near-future Sci-Fi roguelike and tactical squad combat game"
  homepage "http://allureofthestars.com"
  url "https://hackage.haskell.org/package/Allure-0.9.3.3/Allure-0.9.3.3.tar.gz"
  sha256 "22cc64f863bd78b24228175ae338cf13c664728e2291bed3c3dbb3c5aa434e68"
  head "https://github.com/AllureOfTheStars/Allure.git"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2_ttf"

  def install
    install_cabal_package :using => ["happy", "alex"]
  end

  test do
    system "#{bin}/Allure", "--version"
  end
end
