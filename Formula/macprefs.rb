class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.1.1/macprefs-2.1.1.tar.gz"
  sha256 "c83dd4a44a921277c0fbb2911a3b01128eae2cd7ee2cc88c126a24e311aaaa87"

  depends_on "python"
  depends_on "rsync"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end