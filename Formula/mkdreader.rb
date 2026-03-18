class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "97cd5105a05f40d25b0e7f35a089acd4de94bad7be22a96705c533145dd8a90a"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2411e08478253ccd3618823306d3f04f21f12c59e361b109b83e22d8eda31c71"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "9f97bca1068afe161caeed7d1441badafa74c1d22b7e764c5b45d96c9da5d9bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0c715a1726fb47155ea1531bd348713b2b47f1b616bf2f1ec09038d861bc607"
  end

  depends_on "python@3.14"
  uses_from_macos "less"
  on_linux do
    depends_on "less"
  end

  def install
    # Use a portable Python shebang for runtime across Homebrew environments.
    inreplace "mkdreader", %r{^#!.*python[0-9.]*$}, "#!/usr/bin/env python3"
    bin.install "mkdreader"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nworld\n")
    output = shell_output("#{bin}/mkdreader sample.md --no-pager")
    assert_match("HELLO", output)
  end
end
