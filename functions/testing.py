# Code for unit testing functions from main.py
from main import send_initial_notifications, get_user_tokens
import unittest
from unittest.mock import patch, MagicMock

class TestSendInitialNotifications(unittest.TestCase):

    @patch('main.messaging')
    @patch('main.db')
    def test_send_initial_notifications(self, mock_db, mock_messaging):
        # Mock the Firestore database
        mock_collection = mock_db.collection.return_value
        mock_document = mock_collection.document.return_value
        mock_document.get.return_value = MagicMock(
            exists=True,
            to_dict=lambda: {'fcm_token': 'test_token'}
        )

        # Mock game object
        mock_game = MagicMock()
        mock_game.users_available = ['user1', 'user2']
        mock_game.time_UNIX.strftime.return_value = "12/15 15:00"
        mock_game.id = "game123"

        # Call the function
        send_initial_notifications(mock_game)

        # Check if the database was queried for tokens
        mock_db.collection.assert_called_with('users')
        mock_document.get.assert_called()

        # Check if a notification message was created
        mock_messaging.MulticastMessage.assert_called()
        mock_messaging.send_multicast.assert_called()

    @patch('main.db')
    def test_get_user_tokens(self, mock_db):
        # Mock the Firestore database
        mock_collection = mock_db.collection.return_value
        mock_document = mock_collection.document.return_value
        mock_document.get.return_value = MagicMock(
            exists=True,
            to_dict=lambda: {'fcm_token': 'test_token'}
        )

        # Call the function
        tokens = get_user_tokens(['user1', 'user2'])

        # Assertions
        self.assertEqual(tokens, ['test_token', 'test_token'])
        mock_db.collection.assert_called_with('users')
        mock_document.get.assert_called()

if __name__ == '__main__':
    unittest.main()