# Generated by Django 3.0.7 on 2022-02-14 09:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userprofile', '0020_homeloan_file'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='homeloan',
            name='file',
        ),
    ]
