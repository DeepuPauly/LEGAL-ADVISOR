from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    type=models.CharField(max_length=50)

class case_type_table(models.Model):
    case_type=models.CharField(max_length=100)
    details=models.CharField(max_length=100)

class advocate_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    CASETYPE=models.ForeignKey(case_type_table,on_delete=models.CASCADE)
    first_name=models.CharField(max_length=50)
    last_name=models.CharField(max_length=50)
    gender=models.CharField(max_length=60)
    place=models.CharField(max_length=70)
    post=models.CharField(max_length=70)
    pin=models.BigIntegerField()
    qualification=models.CharField(max_length=50)
    experience=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=50)
    idproof=models.FileField()
    image = models.FileField()


class user_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=50)
    gender=models.CharField(max_length=100)
    phone=models.FileField()
    place=models.CharField(max_length=100)
    post=models.FileField(max_length=100)
    pin=models.BigIntegerField()
    email=models.CharField(max_length=100)

class Entry_level_staff_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post=models.CharField(max_length=50)
    pin=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=80)

class schedule_table(models.Model):
    Advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    from_time=models.TimeField()
    to_time=models.TimeField()
    day=models.DateField()

class case(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    case=models.CharField(max_length=100)
    case_details=models.CharField(max_length=100)
    file=models.FileField()

class booking_table(models.Model):
    ADVOCATE = models.ForeignKey(advocate_table, on_delete=models.CASCADE)
    CASE = models.ForeignKey(case, on_delete=models.CASCADE)
    booking_date = models.DateField()
    status = models.CharField(max_length=100)
    current_date = models.DateField()

class allocation(models.Model):
    advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=100)
    booking=models.ForeignKey(booking_table,on_delete=models.CASCADE)

class complains_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    complains=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)

class feedback_table(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    rating=models.FloatField()
    date=models.DateField()

class chat_table(models.Model):
    from_id=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="a")
    to_id=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="b")
    message=models.CharField(max_length=100)
    date=models.DateField()
    time=models.TimeField()

class case_report(models.Model):
    case_id=models.ForeignKey(case,on_delete=models.CASCADE)
    advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    report=models.FileField()
    date=models.DateField()

class daily_report(models.Model):
    advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    report=models.FileField()
    details=models.CharField(max_length=100)
    date=models.DateField()

class enquiry(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    enquiry=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)

class case_note(models.Model):
    CASE=models.ForeignKey(case,on_delete=models.CASCADE)
    advocate=models.ForeignKey(advocate_table,on_delete=models.CASCADE)
    notes=models.CharField(max_length=100)
    date=models.DateField()

class payment(models.Model):
    booking_date=models.ForeignKey(booking_table,on_delete=models.CASCADE)
    amount=models.IntegerField()
    date=models.DateField()


