from google.cloud.firestore_v1 import FieldFilter

from flaskr.auth import login_required
from flask import (
    Blueprint, render_template, request
)

from flaskr import db

bp = Blueprint('full_calender', __name__)

import uuid


class Event:
    def __init__(self, title, start, end, uid, occupied='Nobody'):
        self.title = title
        self.start = start
        self.end = end
        self.occupied = occupied
        self.uid = uid

    # @staticmethod
    # def from_dict(source):
    #     # ...

    def to_dict(self):
        return {'title': self.title,
                'start': self.start,
                'end': self.end,
                'occupied': self.occupied,
                'uid': self.uid
                }

    # def __repr__(self):
    #     return f"City(\
    #             name={self.name}, \
    #             country={self.country}, \
    #             population={self.population}, \
    #             capital={self.capital}, \
    #             regions={self.regions}\
    #         )"


def getEvent(title, start, end):
    # event1 =db.collection('events').get()
    # print(event1[0].to_dict())
    events = db.collection('events').where("title", "==", title.lower().strip()).stream()

    lis = []
    for event in events:
        event1 = event.to_dict()
        if event1['start'] == start and event1['end'] == end:
            lis.append(event)
    return lis


def makeUid():
    uuid_str = str(uuid.uuid4()).replace("-", "")
    uuid_str = uuid_str[:15] + uuid_str[-15:]
    return uuid_str


@bp.route("/calendar", methods=('GET', 'POST'))
@login_required
def fullCalendar():
    # db = get_db()
    if request.method == 'POST':
        delete = request.form.get('delete')
        editW = request.form.get('editW')
        start = request.form.get('start')
        title = request.form.get('title')
        editT = request.form.get('editT')
        end = request.form.get('end')
        if delete is not None:
            docs = getEvent(delete, start, end)
            for doc in docs:
                doc.reference.delete()
            # db.execute('DELETE FROM events WHERE title=? AND start=? AND end=?', (delete.lower(), start, end))
            # db.commit()
        elif editW is not None:
            #     print(f'{start=}')
            #     print(f'{end=}')

            docs = getEvent(title, start, end)
            for doc in docs:
                doc.reference.update({'occupied': editW})
            # db.collection('events').document(idd).update({'occupied': editW})

            # db.execute('UPDATE events SET occupied=? WHERE start=? AND title=? AND end=?', (editW, start, title.lower(), end))
            # db.commit()

        elif editT is not None:
            docs = getEvent(title.lower(), start, end)
            for doc in docs:
                doc.reference.update({'title': editT})
            # db.execute('UPDATE events SET title=? WHERE title=? AND start=? AND end=?', (editT, title.lower(), start, end))
            # db.commit()
        else:
            title = request.form['name']
            start = request.form['starttime']
            end = request.form['endtime']
            event = Event(title.lower(), start, end)
            db.collection('events').document().set(event.to_dict())
            # db.execute('INSERT INTO events(title,start,end,occupied) VALUES (?,?,?,?)', (title, start, end, props))
        # db.commit()
    events = db.collection('events').get()
    events = list(map(lambda event: event.to_dict() | {'id': event.id}, events))
    # events = db.execute('SELECT * FROM events').fetchall()
    return render_template("admin/fullCalendar.html", events=events)
