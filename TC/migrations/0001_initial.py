# Generated by Django 3.2.25 on 2024-09-22 15:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='login_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('type', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='product_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('model', models.IntegerField()),
                ('year', models.IntegerField()),
                ('image', models.FileField(upload_to='')),
                ('company', models.CharField(max_length=50)),
                ('details', models.CharField(max_length=50)),
                ('history', models.CharField(max_length=50)),
                ('service', models.CharField(max_length=50)),
                ('warranty', models.CharField(max_length=50)),
                ('color', models.CharField(max_length=50)),
                ('fuel', models.CharField(max_length=50)),
                ('km', models.CharField(max_length=50)),
                ('manul', models.CharField(max_length=50)),
                ('owner', models.CharField(max_length=50)),
                ('battary', models.CharField(max_length=50)),
                ('price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='user_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('pin', models.IntegerField()),
                ('post', models.CharField(max_length=50)),
                ('phone', models.BigIntegerField()),
                ('image', models.FileField(upload_to='')),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='TC.login_table')),
            ],
        ),
        migrations.CreateModel(
            name='staff_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('pin', models.IntegerField()),
                ('post', models.CharField(max_length=50)),
                ('phone', models.BigIntegerField()),
                ('image', models.FileField(upload_to='')),
                ('login_ID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='TC.login_table')),
            ],
        ),
    ]
