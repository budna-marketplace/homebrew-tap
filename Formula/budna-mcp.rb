class BudnaMcp < Formula
  desc "MCP tools for the Budna marketplace API"
  homepage "https://github.com/budna-marketplace/mcp"
  url "https://github.com/budna-marketplace/mcp.git",
      revision: "c15f3025a2981e90e75fddd0651f3c9304f2c2b3"
  version "0.4.0"
  license "MIT"

  depends_on "rust" => :build

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/budna-mcp")
  end

  test do
    assert_equal "budna-mcp #{version}", shell_output("#{bin}/budna-mcp --version").strip
  end
end
