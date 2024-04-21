class Event:
    def __init__(self, title, start, end, occupied='Nobody'):
        self.title = title
        self.start = start
        self.end = end
        self.occupied = occupied

    # @staticmethod
    # def from_dict(source):
    #     # ...

    def to_dict(self):
        return {'title': self.title,
                'start': self.start,
                'end': self.end,
                'occupied': self.occupied
                }

    # def __repr__(self):
    #     return f"City(\
    #             name={self.name}, \
    #             country={self.country}, \
    #             population={self.population}, \
    #             capital={self.capital}, \
    #             regions={self.regions}\
    #         )"


# class User:
#     def __init__(self, name, email, password):
class TimeCards:
    def __init__(self, name, house, dayNum, timeId, CIDay, CItime, CODay=None, COtime=None, CICO='CO'):
        self.name = name
        self.house = house
        self.dayNum = dayNum
        self.CICO = CICO
        self.CIDay = CIDay
        self.CODay = CODay
        self.CItime = CItime
        self.COtime = COtime
        self.timeId = timeId

    # time_id   INTEGER REFERENCES user (id),
    # name      TEXT    NOT NULL,
    # house     TEXT    NOT NULL,
    # dayNum    INTEGER NOT NULL,
    # CICO      TEXT    NOT NULL,
    # timeIndex INTEGER,
    # CIDay     TEXT    NOT NULL,
    # CODay     TEXT,
    # CItime    TEXT    NOT NULL,
    # COtime    TEXT

    def to_dict(self):
        return {'name': self.name,
                'timeId': self.timeId,
                'data': {
                    'house': self.house,
                    'dayNum': self.dayNum,
                    'CICO': self.CICO,
                    'CIDay': self.CIDay,
                    'CODay': self.CODay,
                    'CItime': self.CItime,
                    'COtime': self.COtime,
                    }
                }


class Charts:
    def __init__(self, resident, roomNum, dateSigned):
        self.resident = resident
        self.roomNum = roomNum
        self.dateSigned = dateSigned

    def to_dict(self):
        return {'resident': self.resident,
                'roomNum': self.roomNum,
                'dateSigned': self.dateSigned}
    # chart_id INTEGER,
    # FOREIGN KEY (chart_id) REFERENCES user (id),
    # resident   TEXT NOT NULL,
    # roomNum    INTEGER,
    # dateSigned TEXT NOT NULL
