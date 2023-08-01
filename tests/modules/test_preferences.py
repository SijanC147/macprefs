from unittest.mock import patch
from macprefs.config import get_preferences_dir, get_preferences_backup_dir, get_user
from macprefs.modules import preferences


@patch('macprefs.modules.preferences.copy_dir')
def test_backup(copy_dir_mock):
    source = get_preferences_dir()
    dest = get_preferences_backup_dir()
    preferences.backup()
    copy_dir_mock.assert_called_with(
        source, dest
    )

@patch('macprefs.modules.preferences.ensure_dir_owned_by_user')
@patch('macprefs.modules.preferences.copy_dir')
def test_restore(copy_dir_mock, ensure_mock):
    source = get_preferences_backup_dir()
    dest = get_preferences_dir()
    preferences.restore()
    copy_dir_mock.assert_called_with(
        source, dest, with_sudo=True
    )
    ensure_mock.assert_called_with(
        dest, get_user()
    )