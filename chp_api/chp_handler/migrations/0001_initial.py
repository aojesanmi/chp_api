# Generated by Django 3.1.3 on 2020-12-10 06:58

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Transaction',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_time', models.DateTimeField(auto_now=True)),
                ('query_graph', models.JSONField(default=dict)),
                ('chp_response', models.JSONField(default=dict)),
                ('chp_version', models.CharField(default='', max_length=100)),
                ('chp_data_version', models.CharField(default='', max_length=100)),
                ('pybkb_version', models.CharField(default='', max_length=100)),
                ('chp_client_version', models.CharField(default='', max_length=100)),
                ('genes', models.JSONField(default=dict)),
                ('therapuetic', models.CharField(default='', max_length=100)),
                ('disease', models.CharField(default='', max_length=100)),
                ('outcome_name', models.CharField(default='', max_length=100)),
                ('outcome_op', models.CharField(default='', max_length=10)),
                ('outcome_value', models.IntegerField(default=0)),
            ],
        ),
    ]