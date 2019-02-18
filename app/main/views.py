#主业务逻辑中的视图和路由的定义


#导入蓝图程序,用于构建路由
import datetime
import os
import time

from . import main
#导入　db　,用于操作数据库
from .. import db
#导入实体类,用于操作数据库
from ..models import *

from flask import render_template, request, redirect, session


#主页的访问路径
@main.route('/')
@main.route("/index")
def main_index():
    #查询所有的Category的信息
    categories=Category.query.all()
    #查询所有的Topic的信息
    topics=Topic.query.all()
    #获取登录信息
    if "uid" in session and "uname" in session:
        user=User.query.filter_by(id=session.get('uid')).first()
    return render_template("index.html",params=locals())

#登录页面的访问路径
@main.route('/login',methods=["GET","POST"])
def login_views():
    if request.method == "GET":
        if "uid" in session and "uname" in session:
            return redirect("/")
        return render_template("login.html")
    else:
        #接收前端传递过来的数据
        loginname=request.form.get("username")
        upwd=request.form.get("password")
        #使用接收的用户名和密码到数据库中查询
        user=User.query.filter_by(loginname=loginname,upwd=upwd).first()
        #如果用户存在,将信息保存进session并重定向回首页,否则重定向会登录页
        if user:
            session['uid']=user.id
            session['uname']=user.uname
            return redirect('/')
        else:
            errMsg="用户名或密码不正确"
            return render_template("login.html",errMsg=errMsg)

#退出路径
@main.route("/logout")
def logout_views():
    if "uid" in session and "uname" in session:
        del session['uid']
        del session['uname']
    return redirect("/")


#注册页面的访问路径
@main.route("/register",methods=["GET","POST"])
def register_views():
    if request.method == "GET":
        return render_template("register.html")
    else:
        #获取文本框的值并赋值给user实体对象
        user=User()
        user.loginname=request.form.get('loginname')
        user.uname=request.form.get('username')
        user.email=request.form.get('email')
        user.url=request.form['url']
        user.upwd=request.form.get('password')
        #将数据保存进数据库　　注意自动提交数据是在return之后提交的，所以要手动提交，手动提交是立即提交
        db.session.add(user)
        #手动提交,目的是为了获取提交后的user的id
        db.session.commit()

        #登录
        #当user成功插入进数据库之后,程序会自动将所有的信息取出来再赋值给user实体对象
        session['uid']=user.id
        session['uname']=user.uname
        return redirect("/")



#发表博客的访问路径
@main.route("/release",methods=["GET","POST"])
def release_views():
    if request.method == "GET":
        #权限验证:验证用户是否有发表博客的权限即必须是登录用户并且is_author的值必须为1
        if "uid" in session and "uname" in session:
            user=User.query.filter_by(id=session.get("uid")).first()
            if user.is_author==1:
                categories=Category.query.all()
                blogTypes=BlogType.query.all()
                return render_template("release.html",params=locals())
            else:
                return redirect("/")
        else:
            return render_template("login.html")
    else:
        topic=Topic()
        #为title赋值
        topic.title=request.form.get("author")
        #为blogtype_id赋值
        topic.blogtype_id=request.form.get("list")
        #为category_id赋值
        topic.category_id=request.form.get("category")
        #为user_id赋值
        topic.user_id=session.get("uid")
        #为content赋值
        topic.content=request.form.get("content")
        #为pub_date赋值
        topic.pub_date=datetime.datetime.now().strftime("%Y-%m-%d")
        #选择性的为images赋值
        if request.files:
            #取出文件
            f=request.files["picture"]
            #处理文件名称,将名称赋值给topic.images
            ftime=datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
            #获取文件的扩展名
            ext=f.filename.split('.')[1]
            filename=ftime+"."+ext
            topic.images="upload/"+filename
            #将文件保存在服务器
            #由于当前目录是在main下，所以要到他的上一级目录app
            basedir=os.path.dirname(os.path.dirname(__file__))
            upload_path=os.path.join(basedir,"static/upload",filename)
            f.save(upload_path)
        db.session.add(topic)
        return redirect("/")

@main.route("/info",methods=["GET","POST"])
def info_views():
    if request.method == "GET":
        #查询要看的博客信息
        topic_id=request.args.get("topic_id")
        topic = Topic.query.filter_by(id=topic_id).first()
        reply = Reply.query.filter_by(id=topic_id).all()
        count = len(reply)
        print(reply)
        #更新阅读量
        topic.read_num=int(topic.read_num)+1
        db.session.add(topic)

        #查找上一篇　以及　下一篇
        #上一篇:查询topic_id比当前topic_id值小的最后一条数据
        prevTopic=Topic.query.filter(Topic.id<topic_id).order_by('id desc').first()
        #下一篇:查询topic_id比当前topic_id值大的第一条数据
        nextTopic=Topic.query.filter(Topic.id>topic_id).first()
        #查询登录用户
        if "uid" in session and "uname" in session:
            user=User.query.filter_by(id=session["uid"])
        return render_template("info.html",params=locals())
    else:
        if "uid" in session and "uname" in session:
            user=User.query.filter_by(id=session.get("uid")).first()
            reply = Reply()
            # 为user_id赋值
            reply.user_id = user.id
            # 为topic_id赋值
            reply.topic_id = request.form.get("topic_id")
            # 为content赋值
            reply.content = request.form.get("content")
            # 为user_id赋值
            reply.reply_time = datetime.datetime.now()

            db.session.add(reply)
            return redirect("/")
        else:
            return render_template("login.html")

@main.route("/list")
def list_views():
    # 查询所有的Category的信息
    categories = Category.query.all()
    # 查询所有的Topic的信息
    topics = Topic.query.all()
    # 获取登录信息
    if "uid" in session and "uname" in session:
        user = User.query.filter_by(id=session.get('uid')).first()
    return render_template("list.html", params=locals())

@main.route("/time")
def time_views():
    # 查询所有的Topic的信息
    topics = Topic.query.all()
    # 查询登录用户
    if "uid" in session and "uname" in session:
        user = User.query.filter_by(id=session["uid"])
    return render_template("time.html", params=locals())

@main.route("/about")
def about_views():
    # 查询登录用户
    if "uid" in session and "uname" in session:
        user = User.query.filter_by(id=session["uid"])
    return render_template("about.html")


@main.route("/gbook",methods=["GET","POST"])
def gbook_views():
    if request.method == "GET":

        #查询登录用户
        if "uid" in session and "uname" in session:
            user=User.query.filter_by(id=session["uid"])
        return render_template("gbook.html",params=locals())
    else:
        if "uid" in session and "uname" in session:
            user=User.query.filter_by(id=session.get("uid")).first()
            reply = Reply()
            # 为user_id赋值
            reply.user_id = user.user_id
            # 为topic_id赋值
            reply.topic_id = request.form.get("topic_id")
            # 为content赋值
            reply.content = request.form.get("content")
            # 为user_id赋值
            reply.reply_time = datetime.datetime.now()

            db.session.add(reply)
            return redirect("/")
        else:
            return render_template("login.html")
    return render_template("gbook.html")


@main.route("/photo")
def photo_views():
    # 查询登录用户
    if "uid" in session and "uname" in session:
        user = User.query.filter_by(id=session["uid"])
    return render_template("photo.html")

