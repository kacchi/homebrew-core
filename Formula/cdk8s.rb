require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.58.tgz"
  sha256 "d8aa6868c5cefb52dfd783f9247b9334334bbf6c622e565c82f6a0e958bb43d9"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "7de856898ce744f5f65d71c2a01dffa68f0e63ebc606532018a1e7dbb5c3bc95"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
