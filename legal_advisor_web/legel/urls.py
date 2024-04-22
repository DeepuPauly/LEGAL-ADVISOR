from django.urls import path
from legel import views
urlpatterns=[
    path('',views.login,name="login"),
    path('case_code',views.case_code,name="case_code"),
    path('view_case_report_search',views.view_case_report_search,name="view_case_report_search"),
    path('add_case_details',views.add_case_details,name="add_case_details"),
    path('allocation_report',views.allocation_report,name="allocation_report"),
    path('view_advocate_report_serach',views.view_advocate_report_serach,name="view_advocate_report_serach"),
    path('add_entry_level_staff',views.add_entry_level_staff,name="add_entry_level_staff"),
    path('view_feedback_search', views.view_feedback_search, name="view_feedback_search"),
    path('view_complians_and_send_reply_search', views.view_complians_and_send_reply_search, name="view_complians_and_send_reply_search"),
    path('adm_home',views.adm_home,name="adm_home"),
    path('view_booking',views.view_booking,name="view_booking"),
    path('manage_entry_level_staff_search', views.manage_entry_level_staff_search, name="manage_entry_level_staff_search"),
    path('add_entry_level_staffcode', views.add_entry_level_staffcode, name="add_entry_level_staffcode"),
    path('edit_entrylevel_staff/<int:id>', views.edit_entrylevel_staff, name="add_entry_level_staffcode"),
    path('delete_entrylevel_staff/<int:id>', views.delete_entrylevel_staff, name="delete_entrylevel_staff"),
    path('edit_staff', views.edit_staff, name="edit_staff"),
    path('case_type_managementsearch',views.case_type_managementsearch,name="case_type_managementsearch"),
    path('case_type_delete/<int:id>',views.case_type_delete,name="case_type_delete"),
    # path('approve_allocation',views.approve_allocation, name="approve_allocation"),
    path('case_type_management',views.case_type_management, name="case_type_management"),
    path('Entry_level_staff',views.Entry_level_staff, name="Entry_level_staff"),
    path('manage_entry_level_staff',views.manage_entry_level_staff, name="manage_entry_level_staff"),
    path('send_reply/<int:id>',views.send_reply, name="send_reply"),
    path('reply',views.reply, name="reply"),
    path('view_advocate_report',views.view_advocate_report, name="view_advocate_report"),
    path('view_case_report',views.view_case_report, name="view_case_report"),
    path('view_complians_and_send_reply',views.view_complians_and_send_reply, name="view_complians_and_send_reply"),
    path('view_feedback',views.view_feedback, name="view_feedback"),
    path('view_payment_details', views.view_payment_details, name="view_payment_details"),
    path('add_case_type', views.add_case_type, name="add_case_type"),
    path('advocate_home', views.advocate_home, name="advocate_home"),
    path('allocate_users', views.allocate_users, name="allocate_users"),
    path('vcase_report', views.vcase_report, name="vcase_report"),
    path('manage_case_note', views.manage_case_note, name="manage_case_note"),
    path('send_complains', views.send_complains, name="send_complains"),
    path('update_case_status', views.update_case_status, name="update_case_status"),
    path('update_daily_report', views.update_daily_report, name="update_daily_report"),
    path('upload_report', views.upload_report, name="upload_report"),
    path('view_case_details_and_files', views.view_case_details_and_files, name="view_case_details_and_files"),
    path('view_case_details', views.view_case_details, name="view_case_details"),
    path('view_feedback_and_rating', views.view_feedback_and_rating, name="view_feedback_and_rating"),
    path('add_advocate_post', views.add_advocate_post, name="add_advocate_post"),
    path('view_profile', views.view_profile, name="view_profile"),
    path('view_reply', views.view_reply, name="view_reply"),
    path('view_time_schedule', views.view_time_schedule, name="view_time_schedule"),
    path('add_advocate', views.add_advocate, name="add_advocate"),
    path('add_schedule', views.add_schedule, name="add_schedule"),
    path('manage_advocate', views.manage_advocate, name="manage_advocate"),
    path('search_advocate', views.search_advocate, name="search_advocate"),
    path('mng_schedule/<int:id>', views.mng_schedule, name="mng_schedule"),
    path('edit_advocate/<int:id>', views.edit_advocate, name="edit_advocate"),
    path('edit_adv', views.edit_adv, name="edit_adv"),
    path('delete_advocate/<int:id>', views.delete_advocate, name="delete_advocate"),
    path('view_booking_and_case_details', views.view_booking_and_case_details, name="view_booking_and_case_details"),
    path('view_case_status_report_and_payment/<int:id>', views.view_case_status_report_and_payment,name="view_case_status_report_and_payment"),
    path('view_enquiry_and_send_reply', views.view_enquiry_and_send_reply,name="view_enquiry_and_send_reply"),
    path('login_verification', views.login_verification, name="login_verification"),
    path('Entry_level_staff_home', views.Entry_level_staff_home, name="Entry_level_staff_home"),
    path('view_profile', views.Entry_level_staff_home, name="Entry_level_staff_home"),
    path('view_case_details_e/<int:id>', views.view_case_details_e, name="view_case_details_e"),
    path('edit_mng_schedule/<int:id>', views.edit_mng_schedule, name="edit_mng_schedule"),
    path('edit_schedule', views.edit_schedule, name="edit_schedule"),
    path('delete_mng_schedule/<int:id>', views.delete_mng_schedule, name="delete_mng_schedule"),
    path('staff_send_reply/<int:id>', views.staff_send_reply, name="staff_send_reply"),
    path('add_schedule_post', views.add_schedule_post, name="add_schedule_post"),
    path('staff_reply', views.staff_reply, name="staff_reply"),
    path('logout', views.logout, name="logout"),
    path('view_enquiry_and_send_reply_search', views.view_enquiry_and_send_reply_search, name="view_enquiry_and_send_reply_search"),
    path('srch_view_time_schedule', views.srch_view_time_schedule, name="srch_view_time_schedule"),
    path('adcmp', views.adcmp, name="adcmp"),
    path('addnote', views.addnote, name="addnote"),
    path('upreport', views.upreport, name="upreport"),
    path('dltnote/<int:id>', views.dltnote, name="dltnote"),
    path('chatview', views.chatview, name='chatview'),
    path('coun_msg/<int:id>', views.coun_msg, name='coun_msg'),
    path('coun_insert_chat/<str:msg>/<int:id>', views.coun_insert_chat, name='coun_insert_chat'),
    path('chat_with_candidate', views.chat_with_candidate, name='chat_with_candidate'),
    path('adreports', views.adreports, name='adreports'),
    path('approve_req', views.approve_req, name='approve_req'),
    path('accept_req/<int:id>', views.accept_req, name='accept_req'),
    path('reject_req/<int:id>', views.reject_req, name='reject_req'),

    path('login2', views.login2, name="login2"),
    path('view_comp_reply', views.view_comp_reply, name="view_comp_reply"),
    path('sendcomp', views.sendcomp, name="sendcomp"),
    path('view_advocate', views.view_advocate, name="view_advocate"),
    path('in_message2', views.in_message2, name="in_message2"),
    path('view_message2', views.view_message2, name="view_message2"),
    path('view_advocate_sched', views.view_advocate_sched, name="view_advocate_sched"),
    path('case_register', views.case_register, name="case_register"),
    path('sendfbk', views.sendfbk, name="sendfbk"),
    path('recommended', views.recommended, name="recommended"),
    path('view_bstatus', views.view_bstatus, name="view_bstatus"),
    path('Userregistration', views.Userregistration, name="Userregistration"),
    path('case_type', views.case_type, name="case_type"),
    path('view_enq_reply', views.view_enq_reply, name="view_enq_reply"),
    path('sendenq', views.sendenq, name="sendenq"),
    path('paymentfinish', views.paymentfinish, name="paymentfinish"),

]