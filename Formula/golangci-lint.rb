# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.35.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.35.0/golangci-lint-1.35.0-darwin-amd64.tar.gz"
    sha256 "3d6b79a3386728c524e95390c3b564e6de33e6d67d33b8dcdf361f0a79596d57"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.35.0/golangci-lint-1.35.0-linux-amd64.tar.gz"
    sha256 "d0c0793fe4a6e752c724eb13e01b27aa4ab37e32c5e99a4d8a4b8594cb5d77bd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.35.0/golangci-lint-1.35.0-linux-armv6.tar.gz"
    sha256 "562c7eb303484c66a926b661be2d35443cd10df02561ca5271260f2f6efb1e26"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.35.0/golangci-lint-1.35.0-linux-arm64.tar.gz"
    sha256 "9dedf7fcdbb3e7068131fd8103ed4c53052d0702085f5f379307650d511f8170"
  end

  def install
    bin.install "golangci-lint"
    output = Utils.popen_read("#{bin}/golangci-lint completion bash")
    (bash_completion/"golangci-lint").write output
    output = Utils.popen_read("#{bin}/golangci-lint completion zsh")
    (zsh_completion/"_golangci-lint").write output
    output = Utils.popen_read("#{bin}/golangci-lint completion fish")
    (fish_completion/"eksctl.fish").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/golangci-lint --version"
  end
end
