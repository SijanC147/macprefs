class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.1.0/macprefs-2.1.0.tar.gz"
  sha256 "411e97b56ab96b8d7fe11dd5febd1c7a79cae4660dd4f32d094fd872c2cf64e4"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end