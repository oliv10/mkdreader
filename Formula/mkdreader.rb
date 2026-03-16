class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/YOUR_GITHUB_USERNAME/mkdreader"
  url "https://github.com/YOUR_GITHUB_USERNAME/mkdreader/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_RELEASE_TARBALL_SHA256"
  license "MIT"

  depends_on "python@3.12"
  uses_from_macos "less"
  on_linux do
    depends_on "less"
  end

  def install
    bin.install "mkdreader"
    rewrite_shebang detected_python_shebang, bin/"mkdreader"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nworld\n")
    output = shell_output("#{bin}/mkdreader sample.md --no-pager")
    assert_match("HELLO", output)
  end
end
