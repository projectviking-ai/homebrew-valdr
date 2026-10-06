class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.8"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.8/valdr-v0.3.8-macos-arm64.tar.gz"
    sha256 "eaeb4bce5d92290096b69aaac7b317601330981c2292422bfc04179fa1f42473"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.8/valdr-v0.3.8-linux-arm64.tar.gz"
      sha256 "0a9d4ddf0340083d7efa0fd3113c1ad90ee8c306c3377ffa49e404d5c0e959c6"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.8/valdr-v0.3.8-linux-x64.tar.gz"
      sha256 "16afa232524f5008af506077675296af94fd393a9d2639c13c7d768335ebd776"
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
