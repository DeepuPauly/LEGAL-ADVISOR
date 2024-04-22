import pymysql
from scipy import spatial
con=pymysql.connect(host='localhost',port=3306,password='',user='root',db='legal_advisor')
cmd=con.cursor()
def recommendor(id):
    stuentid=id
    cmd.execute("select * from legel_advocate_table")
    rescrs=cmd.fetchall()
    cmd.execute("select * from legel_user_table where `id`!="+str(stuentid))
    resusers=cmd.fetchall()
    crslist=[]
    for i in rescrs:
        crslist.append(str(i[0]))

    dataset=[]
    for i in resusers:
        row=[]
        crsrow=[]
        cmd.execute("SELECT `advocate_id` FROM `legel_feedback_table` WHERE `user_id`="+str(i[0]))
        crssele=cmd.fetchall()
        for ii in crssele:
            crsrow.append(str(ii[0]))
        for ii in crslist:
            if ii in crsrow:
                row.append(1)
            else:
                row.append(0)

        dataset.append(row)

    qry = "SELECT `advocate_id` FROM `legel_feedback_table` WHERE `user_id`=" + str(id)
    crssele = cmd.fetchall()
    crsrow=[]
    row=[]
    for ii in crssele:
        crsrow.append(str(ii[0]))
    for ii in crslist:
        if ii in crsrow:
            row.append(1)
        else:
            row.append(0)
    print(row)
    # dataset.append(row)
    print(dataset)
    distributions = []
    for i in range(0,len(dataset)):
        sd=spatial.distance.euclidean(row,dataset[i])
        # print(sd)
        # print(i,resusers[i])
        distributions.append([sd, resusers[i][0]])
    results = [i[1] for i in sorted(distributions)[:3]]
    print(distributions)
    print(results)
    lis=[]
    for i in results:
        lis.append(str(i))
    result=','.join(lis)
    print(result)
    return result

# res=recommendor(1)
# print(res,"======")



