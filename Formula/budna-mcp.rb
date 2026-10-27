class BudnaMcp < Formula
  desc "MCP tools for the Budna marketplace API"
  homepage "https://github.com/budna-marketplace/mcp"
  url "https://github.com/budna-marketplace/mcp/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fc290a8cfdf136b2fadb84e82698e48cc421abbd898d6f81185515409f462fa7"
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
