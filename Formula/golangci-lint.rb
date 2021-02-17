# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.37.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.37.0/golangci-lint-1.37.0-darwin-amd64.tar.gz"
    sha256 "26447a0b08958437dc0e32c5ddb79b0c2273654d717aac1aab42d03e6aea7896"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.37.0/golangci-lint-1.37.0-darwin-arm64.tar.gz"
    sha256 "d72a599c9665db633d481f4e8d0241a75db3b9f3f1980694f660961047e7aa68"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.37.0/golangci-lint-1.37.0-linux-amd64.tar.gz"
    sha256 "5fe9852e754b621c5264fb8ac810a75033e7f18e972315a60c5c3f8a37b3cb88"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.37.0/golangci-lint-1.37.0-linux-armv6.tar.gz"
    sha256 "8e912c240fb96f1eb08e4c2108f97762e16a9ccb06f3c9dcad3efe16b54676e1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.37.0/golangci-lint-1.37.0-linux-arm64.tar.gz"
    sha256 "0472b1d0349e2a9872282b2f08e29daef8d92c43823b5f88758f0ce7c9f64be7"
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
