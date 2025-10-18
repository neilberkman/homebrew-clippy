class Clippy < Formula
  desc "Unified clipboard tool for macOS - bridges terminal and GUI clipboard workflows"
  homepage "https://github.com/neilberkman/clippy"
  url "https://github.com/neilberkman/clippy/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "e1775535ee7b00ba1344696d0d60ae8067b445fa0e3b9ffb5fdfb56a0a10a0be"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/clippy"
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"pasty"), "./cmd/pasty"
  end

  test do
    system bin/"clippy", "--version"
    system bin/"pasty", "--version"

    # Test basic functionality
    (testpath/"test.txt").write("test content")
    system bin/"clippy", "-t", testpath/"test.txt"
  end
end
