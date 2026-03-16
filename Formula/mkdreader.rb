class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "2a88990171ce02ae1e8f0dc56101d362c6dd9ac3fcfb49dc06f5ce42214dfa3d"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3603a817b541f5f39161b423db3d9c2627f9a230c96ff114f50ae7c93e9dca1f"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "198e9dedec08fb8c8792ce7dea733a5eeeebb9f9d6ca65b31dfba2f00d43588d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "370c07dfff67624e77617f3c5391b05bcd8e23475b59416ef4936b5e6a527e33"
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
