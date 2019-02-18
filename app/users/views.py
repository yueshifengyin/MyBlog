from flask import render_template

from . import users

@users.route('/users')
def users_views():
    return "<h1>users 小悦悦</h1>"