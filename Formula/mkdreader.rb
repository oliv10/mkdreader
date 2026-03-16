class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2e04a9876630bbc7d0466d60d8eaec87ab04b68bb7180e30d3d72e1de6fdd5cd"
  license "MIT"

  depends_on "python@3.14"
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
