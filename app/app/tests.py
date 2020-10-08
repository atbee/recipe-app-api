from django.test import TestCase

from .calc import add, subtract


class CalcTest(TestCase):

    def test_add_numbers(self):
        self.assertEqual(add(3, 4), 7)

    def test_subtract_numbers(self):
        self.assertEqual(subtract(8, 2), 6)
