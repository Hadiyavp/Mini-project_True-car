# Generated by Django 3.2.25 on 2024-10-27 12:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('TC', '0010_alter_product_table_details'),
    ]

    operations = [
        migrations.AddField(
            model_name='product_booking',
            name='reson',
            field=models.CharField(default='na', max_length=1000),
        ),
    ]
