# Generated by Django 4.0.3 on 2022-04-08 13:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('loan', '0010_approvals'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Approvals',
        ),
    ]
