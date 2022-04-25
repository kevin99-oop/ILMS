from django.test import SimpleTestCase
from django.urls import reverse, resolve
from customer.views import customer_signup_view

class TestUrls(SimpleTestCase):
    def test_signup(self):
        url = reverse('customersignup')
        print(resolve(url))
        self.assertEquals(resolve(url).func, customer_signup_view)