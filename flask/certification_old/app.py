from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.secret_key = "root"

#SqlAlchemy Database Configuration With Mysql
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@127.0.0.1:8306/certification'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


#Creating model table for our CRUD database
class QuestionTemplates(db.Model):
    id        = db.Column(db.Integer, primary_key = True)
    question  = db.Column(db.Text)
    answer    = db.Column(db.Text)
    correct   = db.Column(db.Integer)
    randomize = db.Column(db.Boolean)
    type      = db.Column(db.Text) # Enum()
    aota      = db.Column(db.Boolean)
    nota      = db.Column(db.Boolean)
    enabled   = db.Column(db.Boolean)
    comments  = db.Column(db.Text)

    def __init__(self, question, answer, correct, randomize, type, aota, nota, enabled, comments):

        self.question  = question  
        self.answer    = answer    
        self.correct   = correct   
        self.randomize = randomize 
        self.type      = type      
        self.aota      = aota      
        self.nota      = nota      
        self.enabled   = enabled   
        self.comments  = comments  


#This is the index route where we are going to
#query on all our employee data
@app.route('/')
def Index():
    all_data = QuestionTemplates.query.all()

    return render_template("index.html", question_templates = all_data)


#this route is for inserting data to mysql database via html forms
@app.route('/insert', methods = ['POST'])
def insert():

    if request.method == 'POST':

        question  = request.form['question']
        answer    = request.form['answer']
        correct   = request.form['correct']
        randomize = request.form['randomize']
        type      = request.form['type']
        aota      = request.form['aota']
        nota      = request.form['nota']
        enabled   = request.form['enabled']
        comments  = request.form['comments']  


        my_data = QuestionTemplates(question, answer, correct, randomize, type, aota, nota, enabled, comments)
        db.session.add(my_data)
        db.session.commit()

        flash("Question Template Inserted Successfully")

        return redirect(url_for('Index'))


#this is our update route where we are going to update our question template
@app.route('/update', methods = ['GET', 'POST'])
def update():

    if request.method == 'POST':
        my_data = QuestionTemplates.query.get(request.form.get('id'))

        # Determine whether enabled checkbox is checked
        if request.form.get('enabled'):
            my_data.enabled = True
        else:
            my_data.enabled = False

        # Entries depend on question type

        my_data.type = request.form['type']

        if my_data.type == 'Multiple Choice':

            # Determine if checkboxes are checked
            if request.form.get('randomize'):
                my_data.randomize = True
            else:
                my_data.randomize = False

            if request.form.get('aota'):
                my_data.aota = True
            else:
                my_data.aota = False

            if request.form.get('nota'):
                my_data.nota = True
            else:
                my_data.nota = False

            # Multiple choice default for correct is 1

            correct  = request.form['correct']
            if correct is None:
                my_data.correct = 1
            else:
                my_data.correct = correct

            my_data.question  = request.form['question']
            my_data.answer    = request.form['answer']
            my_data.comments  = request.form['comments']

        elif my_data.type == 'True/False':

            my_data.question  = request.form['question']
            my_data.answer    = request.form['answer']
            my_data.comments  = request.form['comments']
            my_data.correct   = None
            my_data.randomize = None
            my_data.aota      = None
            my_data.nota      = None


        db.session.commit()
        flash("Question Template Updated Successfully")

        return redirect(url_for('Index'))

#this is our update route where we are going to update our question template
#@app.route('/update', methods = ['GET', 'POST'])
#def update():
#
#    if request.method == 'POST':
#        my_data = QuestionTemplates.query.get(request.form.get('id'))
#
#        my_data.question  = request.form['question']
#        my_data.answer    = request.form['answer']
#        my_data.correct   = request.form['correct']
#        my_data.randomize = request.form['randomize']
#        my_data.type      = request.form['type']
#        my_data.aota      = request.form['aota']
#        my_data.nota      = request.form['nota']
#        my_data.enabled   = request.form['enabled']
#        my_data.comments  = request.form['comments']
#
#        db.session.commit()
#        flash("Question Template Updated Successfully")
#
#        return redirect(url_for('Index'))


#This route is for deleting our employee
@app.route('/delete/<id>/', methods = ['GET', 'POST'])
def delete(id):
    my_data = QuestionTemplates.query.get(id)
    db.session.delete(my_data)
    db.session.commit()
    flash("Question Template Deleted Successfully")

    return redirect(url_for('Index'))

if __name__ == "__main__":
    app.run(debug=True)
