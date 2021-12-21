require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.57.tgz"
  sha256 "4a361fecf135f82384dbf532d0498bfe1f9735d9f22fe1b0d8c9d56ce738d66c"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "a57560884549d240974e89bf6435f908f54cf8112a791a40117f39badb692cb5"
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
