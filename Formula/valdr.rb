class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.3"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.3/valdr-v0.3.3-macos-arm64.tar.gz"
    sha256 "5bd2d7b97c3080a15d3b04b59264d91517b74000f875e79be09532effe5ff593"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.3/valdr-v0.3.3-linux-arm64.tar.gz"
      sha256 "0839f4dd2188dadca69f3e0085983c85272216f1fbebd4443db9b7756e48ea00"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.3/valdr-v0.3.3-linux-x64.tar.gz"
      sha256 "98f6fcea1cf732022cff61034555a35d2a0b252e3e6a75807c664e838564a46d"
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
