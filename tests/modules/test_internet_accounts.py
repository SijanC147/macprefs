from unittest.mock import patch
from macprefs.modules import internet_accounts
from macprefs import config


@patch("macprefs.modules.internet_accounts.backup_internet_accounts")
def test_backup(internet_accounts_mock):
    internet_accounts.backup()
    internet_accounts_mock.assert_called_once()


@patch("macprefs.modules.internet_accounts.restore_internet_accounts")
def test_restore(internet_accounts_mock):
    internet_accounts.restore()
    internet_accounts_mock.assert_called_once()


@patch("macprefs.modules.internet_accounts.copy_dir")
def test_backup_internet_accounts(copy_mock):
    source = config.get_internet_accounts_dir()
    dest = config.get_internet_accounts_backup_dir()
    internet_accounts.backup_internet_accounts()
    copy_mock.assert_called_with(source, dest)


@patch("macprefs.modules.internet_accounts.ensure_dir_owned_by_user")
@patch("macprefs.modules.internet_accounts.copy_dir")
def test_restore_internet_accounts(copy_mock, owned_mock):
    internet_accounts.restore_internet_accounts()
    copy_mock.assert_called_with(
        config.get_internet_accounts_backup_dir(),
        config.get_internet_accounts_dir(),
        with_sudo=True,
    )
    owned_mock.assert_called_with(
        config.get_internet_accounts_dir(), config.get_user()
    )
