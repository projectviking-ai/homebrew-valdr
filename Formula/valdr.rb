class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.4.1"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.1/valdr-v0.4.1-macos-arm64.tar.gz"
    sha256 "fa33d2201e959855775d59c04ad825caf99290c0bc6dd69cca16411c7f0d2131"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.1/valdr-v0.4.1-linux-arm64.tar.gz"
      sha256 "731eaa3ae2de5c11cfa9f9c641555bfc6752d2ba4a9da4ca9f4ccb1d7d2e60b2"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.1/valdr-v0.4.1-linux-x64.tar.gz"
      sha256 "05c6bfa3f02b8bfcd2a98580885307a94d7ccd61e0076e9e084f57b1cd6d09ae"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
