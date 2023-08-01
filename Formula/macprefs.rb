class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.0.21/macprefs-2.0.21.tar.gz"
  sha256 "2efd8cf2341d41cceb2e5af014004f53808c5967fadeba6e0c9b1ce14c7971d6"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end