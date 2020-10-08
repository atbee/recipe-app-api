from django.test import TestCase

from .calc import add


class CalcTest(TestCase):

    def test_add_number(self):
        self.assertEqual(add(3, 4), 7)
