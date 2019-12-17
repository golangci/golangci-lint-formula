# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.21.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.20.1/golangci-lint-1.21.0-darwin-amd64.tar.gz"
    sha256 "c3b4d140ef745334809cecccab3c9a1486c668edc36205086fefb1181ce6d773"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/golangci/golangci-lint/releases/download/v1.20.1/golangci-lint-1.21.0-linux-amd64.tar.gz"
      sha256 "2c67374374dbfeffd6b4c679b1c8341ca1dd2ce7fc9c6a80414204293aeb5d97"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/golangci/golangci-lint/releases/download/v1.20.1/golangci-lint-1.21.0-linux-arm64.tar.gz"
        sha256 "5463f2d1301a22faa2509d353a01e35f0e3251736423de151915a995148d5948"
      else
        url "https://github.com/golangci/golangci-lint/releases/download/v1.20.1/golangci-lint-1.21.0-linux-armv6.tar.gz"
        sha256 "690c5c503c089ca72bbb8f5de71aa6405e8ae77f60204cc79d683e546453ddca"
      end
    end
  end

  def install
    bin.install "golangci-lint"
    output = Utils.popen_read("#{bin}/golangci-lint completion bash")
    (bash_completion/"golangci-lint").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/golangci-lint --version"
  end
end
