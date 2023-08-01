from unittest.mock import patch

from macprefs.config import get_ssh_backup_dir, get_ssh_user_dir, get_user
from macprefs.modules import ssh_files

@patch('macprefs.modules.ssh_files.copy_dir')
def test_backup(copy_dir_mock):
    ssh_files.backup()
    copy_dir_mock.assert_called_with(
        get_ssh_user_dir(), get_ssh_backup_dir()
    )


@patch('macprefs.modules.ssh_files.exists')
@patch('macprefs.modules.ssh_files.copy_dir')
def test_backup_works_when_no_ssh_exists(copy_dir_mock, exists_mock):
    exists_mock.return_value = False
    ssh_files.backup()
    copy_dir_mock.assert_not_called()


@patch('macprefs.modules.ssh_files.ensure_dir_owned_by_user')
@patch('macprefs.modules.ssh_files.copy_dir')
def test_restore(copy_dir_mock, ensure_mock):
    dest = get_ssh_user_dir()
    ssh_files.restore()
    copy_dir_mock.assert_called_with(
        get_ssh_backup_dir(), dest, with_sudo=True
    )
    ensure_mock.assert_called_with(dest, get_user())


@patch('macprefs.modules.ssh_files.exists')
@patch('macprefs.modules.ssh_files.copy_dir')
def test_restore_works_when_no_ssh_exists(copy_dir_mock, exists_mock):
    exists_mock.return_value = False
    ssh_files.restore()
    copy_dir_mock.assert_not_called()
