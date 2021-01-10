from django.contrib.auth import get_user_model
from django.test import TestCase


class TestUserModel(TestCase):

    def test_create_new_user_with_email_should_be_successful(self):
        email = 'test@recipe.project'
        password = 'TestP@ssword1234'
        user = get_user_model().objects.create_user(
            email=email,
            password=password,
        )

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))
