import json
from datetime import datetime

import pymysql
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
# Create your views here.
from legel.models import *
from legel.rec import recommendor


def login(request):
    return render(request,'login_index.html')
def logout(request):
    auth.logout(request)
    return render(request,'login_index.html')
def login_verification(request):
        username=request.POST['textfield']
        password=request.POST['textfield2']
        try:
            result=login_table.objects.get(username=username,password=password)
            request.session['type']=result.type
            if result.type=="admin":
                # ob1=auth.authenticate(username="admin",password="admin")
                # if ob1 is not None:
                #     auth.login(request,ob1)
                request.session['lid']=result.id
                return HttpResponse('''<script>alert("succesfully login");window.location="/adm_home#about"</script>''')
            elif result.type=="advocate":
                # ob1 = auth.authenticate(username="admin", password="admin")
                # if ob1 is not None:
                #     auth.login(request, ob1)
                request.session['lid'] = result.id
                return HttpResponse('''<script>alert("succesfully login");window.location="/advocate_home#about"</script>''')
            elif result.type=="entry_staff":
                # ob1 = auth.authenticate(username="admin", password="admin")
                # if ob1 is not None:
                #     auth.login(request, ob1)
                request.session['lid'] = result.id
                return HttpResponse('''<script>alert("succesfully login");window.location="/Entry_level_staff_home#about"</script>''')
            else:
                return HttpResponse('''<script>alert("invalid username and password");window.location="/"</script>''')
        except:
            return HttpResponse('''<script>alert("invalid username and password");window.location="/"</script>''')

# # @login_required(login_url='/')

def add_case_details(request):
    return render(request,'admin/add case details.html')
# # @login_required(login_url='/')

def case_code(request):
    cs=request.POST['textfield']
    nt=request.POST['textfield2']
    ob=case_type_table()
    ob.case_type=cs
    ob.details=nt
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location="/case_type_management#about"</script>''')

# # @login_required(login_url='/')

def Entry_level_staff_home(request):
    return render(request,'entry_staff/entrystaff_index.html')

# # @login_required(login_url='/')

def add_entry_level_staff(request):
    return render(request, 'admin/add entry level staff.html')

# # @login_required(login_url='/')


def add_entry_level_staffcode(request):
    name=request.POST['textfield33']
    gender=request.POST['radiobutton']
    place=request.POST['textfield3']
    pin=request.POST['textfield4']
    post=request.POST['textfield5']
    phone=request.POST['textfield6']
    email=request.POST['textfield7']
    username=request.POST['textfield8']
    password=request.POST['textfield9']

    ob=login_table()
    ob.username=username
    ob.password=password
    ob.type="entry_staff"
    ob.save()

    oj=Entry_level_staff_table()
    oj.login=ob
    oj.name=name
    oj.gender=gender
    oj.place=place
    oj.pin=pin
    oj.post=post
    oj.phone=phone
    oj.email=email
    oj.save()
    return HttpResponse('''<script>alert("successfully added");window.location="/manage_entry_level_staff#about"</script>''')


# # @login_required(login_url='/')


def edit_entrylevel_staff(request,id):
    ob = Entry_level_staff_table.objects.get(id=id)
    request.session['sid']=id
    return render(request,'admin/edit_entrylevelstaff.html',{'val':ob})

# # @login_required(login_url='/')


def edit_staff(request):
    nm = request.POST['textfield33']
    gndr = request.POST['radiobutton']
    plce =request.POST['textfield3']
    pin =request.POST['textfield4']
    pst =request.POST['textfield5']
    phne =request.POST['textfield6']
    mail =request.POST['textfield7']

    ob = Entry_level_staff_table.objects.get(id=request.session['sid'])
    ob.name=nm
    ob.gender=gndr
    ob.place=plce
    ob.pin=pin
    ob.post=pst
    ob.phone=phne
    ob.email=mail
    ob.save()
    return HttpResponse('''<script>alert("Successfully Edited");window.location="/manage_entry_level_staff#about"</script>''')


# # @login_required(login_url='/')


def delete_entrylevel_staff(request,id):
    ob = Entry_level_staff_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Successfully Deleted");window.location="/manage_entry_level_staff#about"</script>''')



# # @login_required(login_url='/')


def adm_home(request):
    return render(request,'index.html')

# def approve_allocation(request):
#     ob=allocation.objects.all()
#     return render(request, 'admin/view booking.html', {'val':ob})

# # @login_required(login_url='/')


def case_type_management(request):
    ob=case_type_table.objects.all()
    return render(request,'admin/case type management - Copy.html',{'val':ob})

# # @login_required(login_url='/')


def case_type_managementsearch(request):
    case=request.POST['tf']
    ob=case_type_table.objects.filter(case_type__icontains=case)
    return render(request,'admin/case type management - Copy.html',{'val':ob, 'n': case})


def case_type_delete(request,id):
    ob=case_type_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("successfully deleted");window.location="/case_type_management#about"</script>''')

# # @login_required(login_url='/')


def Entry_level_staff(request):
    return render(request,'admin/Entry level staff.html')

# # @login_required(login_url='/')


def view_booking(request):
    ob=booking_table.objects.all()
    return render(request,'admin/view booking.html',{'val':ob})

# # @login_required(login_url='/')


def manage_entry_level_staff(request):
    ob=Entry_level_staff_table.objects.all()
    return render(request,'admin/manage entry level staff.html',{'val':ob})


# # @login_required(login_url='/')


def manage_entry_level_staff_search(request):
    n=request.POST['tf']
    ob=Entry_level_staff_table.objects.filter(name__icontains=n)
    return render(request,'admin/manage entry level staff.html',{'val':ob,'n': n})

# # @login_required(login_url='/')


def send_reply(request,id):
    request.session['cid']=id
    return render(request,'admin/send reply.html')

# # @login_required(login_url='/')


def reply(request):
    rply = request.POST['a']
    ob=complains_table.objects.get(id = request.session['cid'])
    ob.reply = rply
    ob.save()
    return HttpResponse('''<script>alert("successfully Replied");window.location="/view_complians_and_send_reply#about"</script>''')



# # @login_required(login_url='/')


def view_advocate_report(request):
    ob=daily_report.objects.all()
    return render(request,'admin/view advocate report.html',{'val':ob})

# # @login_required(login_url='/')


def view_advocate_report_serach(request):
    date = request.POST['textfield']
    ob=daily_report.objects.filter(date=date)
    return render(request,'admin/view advocate report.html',{'val':ob,'search': date})

# # @login_required(login_url='/')


def view_case_report(request):
    ob=case_report.objects.all()
    return render(request,'admin/view case report.html',{'val':ob})

# # @login_required(login_url='/')

def view_case_report_search(request):
    date = request.POST['textfield']
    ob=case_report.objects.filter(date=date)
    return render(request,'admin/view case report.html',{'val':ob,'search': date})

# # @login_required(login_url='/')

def view_complians_and_send_reply(request):
    ob=complains_table.objects.all()
    return render(request,'admin/view complains and send reply.html',{'val':ob})

# # @login_required(login_url='/')

def view_complians_and_send_reply_search(request):
    n=request.POST['textfield']
    ob=complains_table.objects.filter(date=n)
    return render(request,'admin/view complains and send reply.html',{'val':ob,'n':n})

# # @login_required(login_url='/')

def view_feedback(request):
    ob=feedback_table.objects.all()
    return render(request,'admin/view feedback.html',{'val':ob})

# # @login_required(login_url='/')


def view_feedback_search(request):
    n = request.POST['textfield']
    ob=feedback_table.objects.filter(date=n)
    return render(request,'admin/view feedback.html',{'val':ob, 'n': n})

# # @login_required(login_url='/')


def view_payment_details(request):
    ob=payment.objects.all()
    return render(request,'admin/view payment details.html',{'val':ob})

# # @login_required(login_url='/')


def allocation_report(request):
    ob=allocation.objects.all()
    return render(request,'admin/allocation report.html',{'val':ob})




#=======================entry_staff===========>

# # @login_required(login_url='/')


def add_advocate(request):
    ob=case_type_table.objects.all()
    return render(request,'entry_staff/add advocate.html',{'val':ob})

# # @login_required(login_url='/')


def add_advocate_post(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    gndr=request.POST['radiobutton']
    plce=request.POST['textfield3']
    pst=request.POST['textfield4']
    pin=request.POST['textfield5']
    quali=request.POST['textfield6']
    exp=request.POST['textfield7']
    phn=request.POST['textfield8']
    mail=request.POST['textfield9']
    id_proof = request.FILES['file']
    photo = request.FILES['file1']
    fss = FileSystemStorage()
    proof_file = fss.save(id_proof.name, id_proof)
    photo_file = fss.save(photo.name, photo)
    casetype=request.POST['select']
    username = request.POST['textfield10']
    password = request.POST['textfield11']

    ob=login_table()
    ob.username = username
    ob.password = password
    ob.type = "advocate"
    ob.save()

    oj=advocate_table()
    oj.first_name=fname
    oj.last_name=lname
    oj.gender=gndr
    oj.place=plce
    oj.post=pst
    oj.pin=pin
    oj.qualification=quali
    oj.experience=exp
    oj.phone=phn
    oj.email=mail
    oj.idproof = proof_file
    oj.image = photo_file
    oj.login=ob
    oj.CASETYPE=case_type_table.objects.get(id=casetype)
    oj.save()
    return HttpResponse('''<script>alert("successfully added");window.location="/manage_advocate#about"</script>''')

# # @login_required(login_url='/')


def mng_schedule(request,id):
    request.session['ADV_id']=id
    ob=schedule_table.objects.filter(Advocate__id=id)
    return render(request,'entry_staff/mng_schedule.html',{"val":ob})

# # @login_required(login_url='/')


def edit_mng_schedule(request,id):
    request.session['MNG_id']=id
    ob=schedule_table.objects.get(id=id)

    return render(request,'entry_staff/edit schedule.html',{"d":str(ob.day),"ft":str(ob.from_time),"tt":str(ob.to_time)})

# # @login_required(login_url='/')


def edit_schedule(request):
    dte=request.POST['textfield']
    ftime=request.POST['textfield2']
    ttime=request.POST['textfield3']

    ob = schedule_table.objects.get(id=request.session['MNG_id'])
    ob.date=dte
    ob.from_time=ftime
    ob.to_time=ttime
    ob.save()
    return HttpResponse('''<script>alert("Successfully Edited");window.location='/manage_advocate#about'</script>''')

# # @login_required(login_url='/')


def delete_mng_schedule(request,id):
    ob = schedule_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Successfully deleted");window.location='/manage_advocate#about'</script>''')




# # @login_required(login_url='/')


def add_schedule(request):
    return render(request,'entry_staff/add schedule.html')

# # @login_required(login_url='/')


def add_schedule_post(request):
    date=request.POST['textfield']
    ftime=request.POST['textfield2']
    ttime=request.POST['textfield3']

    ob=schedule_table()
    ob.Advocate=advocate_table.objects.get(id=request.session['ADV_id'])
    ob.from_time=ftime
    ob.to_time=ttime
    ob.day=date
    ob.save()
    return HttpResponse('''<script>alert("Successfully Added");window.location="/manage_advocate#about"</script>''')


# # @login_required(login_url='/')


def manage_advocate(request):
    ob=advocate_table.objects.all()
    return render(request,'entry_staff/manage advocate.html',{'val':ob})

# # @login_required(login_url='/')


def search_advocate(request):
    nm = request.POST['textarea']
    ob=advocate_table.objects.filter(first_name__istartswith=nm)
    return render(request,'entry_staff/manage advocate.html',{'val':ob,'n': nm})



# # @login_required(login_url='/')


def edit_advocate(request,id):
    o=case_type_table.objects.all()
    ob=advocate_table.objects.get(id=id)
    request.session['aid']=id
    return render(request,'entry_staff/edit_advocat.html',{'val':ob,'val1':o})

# # @login_required(login_url='/')


def edit_adv(request):

    fname= request.POST['textfield']
    lname= request.POST['textfield2']
    casetype = request.POST['select']
    gndr =request.POST['radiobutton']
    plce =request.POST['textfield3']
    pst =request.POST['textfield4']
    pin =request.POST['textfield5']
    Quali =request.POST['textfield6']
    Exp =request.POST['textfield7']
    phne =request.POST['textfield8']
    mail =request.POST['textfield9']




    ob = advocate_table.objects.get(id=request.session['aid'])
    ob.first_name=fname
    ob.last_name=lname
    ob.CASETYPE=case_type_table.objects.get(id=casetype)
    ob.gender=gndr
    ob.place=plce
    ob.pin=pin
    ob.post=pst
    ob.qualification=Quali
    ob.experience=Exp
    ob.phone=phne
    ob.email=mail

    fss = FileSystemStorage()
    if 'file' in request.FILES:
        id_proof = request.FILES['file']
        proof_file = fss.save(id_proof.name, id_proof)
        ob.idproof = proof_file
    if 'file1' in request.FILES:
        photo = request.FILES['file1']
        photo_file = fss.save(photo.name, photo)
        ob.image = photo_file
    ob.save()
    return HttpResponse('''<script>alert("Successfully Edited");window.location="/manage_advocate#about"</script>''')

def delete_advocate(request,id):
    ob = login_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Successfully Deleted");window.location="/manage_advocate#about"</script>''')

# # @login_required(login_url='/')

def view_case_details_e(request,id):
    ob =booking_table.objects.filter(id=id)
    return render(request,'entry_staff/view_case.html',{'val':ob})

# # @login_required(login_url='/')

def view_booking_and_case_details(request):
    ob =booking_table.objects.all()
    return render(request,'entry_staff/view booking and case details.html',{'val':ob})

# # @login_required(login_url='/')


def view_case_status_report_and_payment(request,id):
    ob=payment.objects.filter(booking_date__id=id)
    return render(request,'entry_staff/view case status report and payment.html',{'val':ob})

# # @login_required(login_url='/')


def view_enquiry_and_send_reply(request):
    ob =enquiry.objects.all()
    return render(request,'entry_staff/view enquiry and send reply.html',{'val':ob})

# # @login_required(login_url='/')


def view_enquiry_and_send_reply_search(request):
    n=request.POST['text']
    ob=enquiry.objects.filter(date=n)
    return render(request,'entry_staff/view enquiry and send reply.html',{'val':ob})









#=======================entry_staff===========>





# # @login_required(login_url='/')


def advocate_home(request):
    return render(request,'advocate/advocate home.html')

# ============================advocate=============>
# # @login_required(login_url='/')

def add_case_type(request):
    ob=booking_table.objects.filter(ADVOCATE__login__id=request.session['lid'])
    return render(request,'advocate/add case type.html',{'v':ob})
# # @login_required(login_url='/')


def allocate_users(request):
    ob=allocation.objects.filter(advocate__login__id=request.session['lid'])
    print(ob,"=====")
    return render(request,'advocate/allocated users.html',{'val':ob})
# # @login_required(login_url='/')


def vcase_report(request):
    return render(request,'advocate/case report.html')
# # @login_required(login_url='/')


def manage_case_note(request):
    ob=case_note.objects.filter(advocate__login__id=request.session['lid'])
    return render(request,'advocate/manage case note.html',{'val':ob})
# # @login_required(login_url='/')


def send_complains(request):
    return render(request,'advocate/send complains.html')
# # @login_required(login_url='/')


def addnote(request):
    case1=request.POST['s1']
    note=request.POST['textfield2']
    ob=case_note()
    ob.notes=note
    ob.date=datetime.today()
    ob.advocate=advocate_table.objects.get(login__id=request.session['lid'])
    ob.CASE=case.objects.get(id=case1)
    ob.save()
    return HttpResponse('''<script>alert("Successfully send");window.location="/manage_case_note#about"</script>''')
# # @login_required(login_url='/')


def dltnote(request,id):
    ob=case_note.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Successfully deleted!!");window.location="/manage_case_note#about"</script>''')
# # @login_required(login_url='/')


def upreport(request):
    case1 = request.POST['s1']
    note = request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(note.name,note)
    ob = case_report()
    ob.report = fn
    ob.date = datetime.today()
    ob.advocate = advocate_table.objects.get(login__id=request.session['lid'])
    ob.case_id = case.objects.get(id=case1)
    ob.save()
    return HttpResponse('''<script>alert("Successfully send");window.location="/manage_case_note#about"</script>''')
# # @login_required(login_url='/')


def adcmp(request):
    comp=request.POST['textfield']
    ob=complains_table()
    ob.complains=comp
    ob.date=datetime.today()
    ob.reply='pending'
    ob.LOGIN=login_table.objects.get(id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Successfully send");window.location="/view_reply#about"</script>''')
# # @login_required(login_url='/')


def adreports(request):
    case1=request.POST['s1']
    reports=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(reports.name,reports)
    ob=case_report()
    ob.report=fs
    ob.date=datetime.today()
    ob.case_id=case.objects.get(id=case1)
    ob.advocate=advocate_table.objects.get(login__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Successfully send");window.location="/advocate_home#about"</script>''')
# # @login_required(login_url='/')


def update_case_status(request):
    return render(request,'advocate/update case status.html')
# # @login_required(login_url='/')


def update_daily_report(request):
    return render(request,'advocate/update daily report.html')
# # @login_required(login_url='/')


def upload_report(request):
    ob=booking_table.objects.filter(ADVOCATE__login__id=request.session['lid'])
    return render(request,'advocate/upload report.html',{'v':ob})
# # @login_required(login_url='/')


def view_case_details_and_files(request):
    return render(request,'advocate/view case details and files.html')
# # @login_required(login_url='/')


def view_case_details(request):
    return render(request,'advocate/view case details.html')
# # @login_required(login_url='/')


def view_feedback_and_rating(request):
    ob=feedback_table.objects.filter(advocate__login__id=request.session['lid'])
    return render(request,'advocate/view feedback and ratings.html',{"val":ob})
# # @login_required(login_url='/')


def view_profile(request):
    ob=advocate_table.objects.get(login__id=request.session['lid'])
    return render(request,'advocate/view profile.html',{"val":ob})
# # @login_required(login_url='/')


def view_profile_View(request):
    ob=advocate_table.objects.filter(login__id=request.session['lid'])
    return render(request,'advocate/view profile.html', {"val":ob})

# # @login_required(login_url='/')


def view_reply(request):
    ob=complains_table.objects.filter(LOGIN__id=request.session['lid'])
    return render(request,'advocate/view reply.html',{'val':ob})
# # @login_required(login_url='/')


def view_time_schedule(request):
    ob=schedule_table.objects.filter(Advocate__login__id=request.session['lid'])
    return render(request,'advocate/view time schedule.html',{'val':ob})
# # @login_required(login_url='/')


def srch_view_time_schedule(request):
    date=request.POST['date']
    ob=schedule_table.objects.filter(Advocate__login__id=request.session['lid'],day=date)
    return render(request,'advocate/view time schedule.html',{'val':ob,'date':date})

# # @login_required(login_url='/')


def staff_send_reply(request,id):
    request.session['eqid']=id
    return render(request,'entry_staff/send reply.html')
# # @login_required(login_url='/')


def approve_req(request):
    ob=booking_table.objects.filter(ADVOCATE__login__id=request.session['lid'])
    return render(request,'advocate/approve allocation.html',{'val':ob})
# # @login_required(login_url='/')

def accept_req(request,id):
    ob=booking_table.objects.get(id=id)
    ob.status='Accepted'
    ob.save()
    return HttpResponse('''<script>alert("Approved..");window.location="/approve_req#about"</script>''')
# # @login_required(login_url='/')

def reject_req(request,id):
    ob=booking_table.objects.get(id=id)
    ob.status='Rejected'
    ob.save()
    return HttpResponse('''<script>alert("Rejected..");window.location="/approve_req#about"</script>''')

# # @login_required(login_url='/')


def staff_reply(request):
    rply = request.POST['a']
    ob=enquiry.objects.get(id = request.session['eqid'])
    ob.reply = rply
    ob.save()
    return HttpResponse('''<script>alert("successfully Replied");window.location="/view_enquiry_and_send_reply#about"</script>''')



# # @login_required(login_url='/')

def chat_with_candidate(request):
    ob = user_table.objects.all()
    return render(request,'advocate/fur_chat.html',{'val':ob})



# # @login_required(login_url='/')

def chatview(request):
    ob = user_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.firstname+" "+i.lastname,'photo':0,'email':i.email,'loginid':i.login.id}
        d.append(r)
    return JsonResponse(d, safe=False)


# # @login_required(login_url='/')

def coun_msg(request,id):
    ob1=chat_table.objects.filter(from_id__id=id,to_id__id=request.session['lid'])
    ob2=chat_table.objects.filter(from_id__id=request.session['lid'],to_id__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.from_id.id,"msg":i.message,"date":i.date,"chat_id":i.id})
    obu=user_table.objects.get(login__id=id)
    return JsonResponse({"data":res,"name":obu.firstname,"photo":0,"user_lid":obu.login.id})


# # @login_required(login_url='/')

def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=chat_table()
    ob.from_id=login_table.objects.get(id=request.session['lid'])
    ob.to_id=login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.time=datetime.today()
    ob.save()

    return JsonResponse({"task":"ok"})

##########################################################################################webservice



def login2(request):
    try:
        username=request.POST['uname']
        password=request.POST['pass']
        ob=login_table.objects.get(username=username,password=password,type='user')
        if ob is None:
            data={"task":"invalid",'id':0}
        else:
            data={"task":"success",'id':str(ob.id)}
        r=json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid",'id':0}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)


def Userregistration(request):
    firstname=request.POST['fname']
    lastname = request.POST['lname']
    plc = request.POST['plc']
    pst = request.POST['post']
    pin = request.POST['pin']
    ph = request.POST['ph']
    username= request.POST['un']
    password=request.POST['pwd']
    email=request.POST['email']
    gender=request.POST['gender']
    lob = login_table()
    lob.username = username
    lob.password = password
    lob.type='user'
    lob.save()
    ob = user_table()
    ob.login = lob
    ob.firstname = firstname
    ob.lastname=lastname
    ob.place = plc
    ob.gender=gender
    ob.post = pst
    ob.pin = pin
    ob.phone = ph
    ob.email=email
    ob.save()
    data={"task":"success"}
    r=json.dumps(data)
    return HttpResponse(r)
def paymentfinish(request):
    bid=request.POST['bid']
    lid=request.POST['lid']
    ob=payment()
    ob.amount="2000"
    ob.date=datetime.today()
    ob.booking_date=booking_table.objects.get(id=bid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def case_register(request):
    firstname=request.POST['case']
    lastname = request.POST['det']
    aid=request.POST['aid']
    lid=request.POST['lid']
    bdate=request.POST['bdt']
    pic=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(pic.name,pic)
    lob = case()
    lob.user = user_table.objects.get(login__id=lid)
    lob.case = firstname
    lob.case_details=lastname
    lob.file=fs
    lob.save()
    ob = booking_table()
    ob.ADVOCATE = advocate_table.objects.get(id=aid)
    ob.CASE = lob
    ob.booking_date=bdate
    ob.status = 'pending'
    ob.current_date=datetime.today()
    ob.save()
    data={"task":"success",'bid':ob.id}
    r=json.dumps(data)
    return HttpResponse(r)
def view_enq_reply(request):
    id = request.POST['lid']
    ob = enquiry.objects.filter(user__login__id=id)
    data = []
    for i in ob:
        row = {"complaint": i.enquiry, "reply": i.reply, "date": str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def case_type(request):
    ob = case_type_table.objects.all()
    data = []
    for i in ob:
        row = {"case": i.case_type, "det": i.details}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_advocate_sched(request):
    aid=request.POST['aid']
    ob = schedule_table.objects.filter(Advocate__id=aid)
    data = []
    for i in ob:
        row = {"from": str(i.from_time), "cid": i.Advocate.id,'time':str(i.to_time),'day':str(i.day)}
        data.append(row)
    r = json.dumps(data)
    print(r,"===")
    return HttpResponse(r)
def view_advocate(request):
    ob = advocate_table.objects.all()
    data = []
    for i in ob:
        row = {"cmp": i.first_name+" "+i.last_name, "cid": i.id,"lid":i.login.id,'place':i.place,'phone':i.phone}
        data.append(row)
    r = json.dumps(data)
    print(r,"===")
    return HttpResponse(r)
def view_bstatus(request):
    lid=request.POST['lid']
    ob = booking_table.objects.filter(CASE__user__login__id=lid)
    data = []
    for i in ob:
        row = {"cmp": i.ADVOCATE.first_name+" "+i.ADVOCATE.last_name, "status": i.status,'place':i.ADVOCATE.place,'date':str(i.booking_date)}
        data.append(row)
    r = json.dumps(data)
    print(r,"===")
    return HttpResponse(r)

def recommended(request):
    con = pymysql.connect(host='localhost', port=3306, password='', user='root', db='legal_advisor')
    cmd = con.cursor()
    lid=request.POST['lid']
    uid=user_table.objects.get(login__id=lid)
    res=recommendor(uid.id)
    cmd.execute("SELECT * FROM `legel_advocate_table` WHERE id IN(SELECT `advocate_id` FROM `legel_feedback_table` WHERE `user_id` IN(" + res + ")) AND id NOT IN(SELECT `advocate_id` FROM `legel_feedback_table` WHERE `user_id`='"+str(uid)+"')")
    req=cmd.fetchall()
    print(req,"==========================================")
    data = []
    for p in req:
        ob = advocate_table.objects.filter(id=p[0])
        for i in ob:
            row = {"cmp": i.first_name+" "+i.last_name, "cid": i.id,"lid":i.login.id,'place':i.place,'phone':i.phone}
            data.append(row)
    r = json.dumps(data)
    print(r,"===")
    return HttpResponse(r)
# def view_cp(request):
#     ob = guide.objects.all()
#     data = []
#     for i in ob:
#         row = {"cmp": i.First_name+" "+i.Last_name, "cid": i.id,"lid":i.LOGIN.id}
#         data.append(row)
#     r = json.dumps(data)
#     return HttpResponse(r)
def view_comp_reply(request):
    id = request.POST['lid']
    ob = complains_table.objects.filter(LOGIN__id=id)
    data = []
    for i in ob:
        row = {"complaint": i.complains, "reply": i.reply, "date":str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def sendcomp(request):
    complaints=request.POST['comp']
    lid=request.POST['lid']
    ob=complains_table()
    ob.complains= complaints
    ob.date=datetime.today()
    ob.reply='pending'
    ob.LOGIN=login_table.objects.get(id=lid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def sendenq(request):
    complaints=request.POST['comp']
    lid=request.POST['lid']
    ob=enquiry()
    ob.enquiry= complaints
    ob.date=datetime.today()
    ob.reply='pending'
    ob.user=user_table.objects.get(login__id=lid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def sendfbk(request):
    complaints = request.POST['fbk']
    lid = request.POST['lid']
    aid=request.POST['aid']
    rating=request.POST['rating']
    ob = feedback_table()
    ob.rating = rating
    ob.date = datetime.today()
    ob.feedback = complaints
    ob.user = user_table.objects.get(login__id=lid)
    ob.advocate=advocate_table.objects.get(id=aid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def in_message2(request):
    fromid = request.POST['fid']
    toid = request.POST['toid']
    message=request.POST['msg']
    ob=chat_table()
    ob.from_id=login_table.objects.get(id=fromid)
    ob.to_id=login_table.objects.get(id=toid)
    ob.message=message
    ob.date=datetime.today()
    ob.time = datetime.today()
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)
    return HttpResponse(r)
def view_message2(request):
    fromid=request.POST['fid']
    toid=request.POST['toid']
    lmid = request.POST['lastmsgid']
    data1 = []
    ob=chat_table.objects.filter(Q(to_id__id=toid,from_id__id=fromid,id__gt=lmid)|Q(to_id__id=fromid,from_id__id=toid,id__gt=lmid)).order_by('id')
    for i in ob:
        row = {"fromid": i.from_id.id,"date": str(i.date),"message":i.message,"msgid":i.id}
        data1.append(row)
    r = json.dumps({'res1':data1})
    return HttpResponse(r)