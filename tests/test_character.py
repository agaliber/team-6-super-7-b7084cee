from unittest import TestCase
from levelup.character import Character, DEFAULT_CHARACTER_NAME
from tests.map_double import MapDouble
from levelup.direction import Direction
from unittest.mock import patch

class TestCharacter(TestCase):

    def setUp(self):
        self.character = Character("MyName")

    @patch.object(Character, "enter_map")
    def test_enter_map_sets_map_and_updates_position(self, mock_enter_map):
        stubbed_map = MapDouble()
        mock_enter_map.return_value = None
        self.character.enter_map(stubbed_map)

        mock_enter_map.assert_called_once_with(stubbed_map)
        self.assertEqual(self.character.map, stubbed_map)
        self.assertEqual(self.character.current_position, stubbed_map.starting_position)

    @patch.object(Character, "move")
    def test_move_updates_position(self, mock_move):
        mock_move.return_value = None
        self.character.map = MapDouble()
        self.character.move(Direction.EAST)

        mock_move.assert_called_once_with(Direction.EAST)
        self.assertEqual(self.character.current_position.x, self.character.map.STUBBED_X)
        self.assertEqual(self.character.current_position.y, self.character.map.STUBBED_Y)

    def test_init_with_name(self):
        expected_name = "MyName"
        character = Character(expected_name)
        self.assertEqual(character.name, expected_name)

    def test_init_with_empty_name(self):
        character = Character("")
        self.assertEqual(character.name, DEFAULT_CHARACTER_NAME)
