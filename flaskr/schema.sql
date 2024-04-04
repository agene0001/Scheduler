DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS timeCards;
DROP TABLE IF EXISTS charts;
DROP TABLE IF EXISTS events;


CREATE TABLE user
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    username  TEXT UNIQUE NOT NULL,
    password  TEXT        NOT NULL,
    type      TEXT        NOT NULL,
    timeIndex INTEGER,
    CICO      TEXT

);

CREATE TABLE timeCards
(
    time_id   INTEGER REFERENCES user (id),
    name      TEXT    NOT NULL,
    house     TEXT    NOT NULL,
    dayNum    INTEGER NOT NULL,
    CICO      TEXT    NOT NULL,
    timeIndex INTEGER,
    CIDay     TEXT    NOT NULL,
    CODay     TEXT,
    CItime    TEXT    NOT NULL,
    COtime    TEXT
);


CREATE TABLE charts
(
    chart_id   INTEGER REFERENCES user (id),
    resident   TEXT NOT NULL,
    roomNum    INTEGER,
    dateSigned TEXT NOT NULL

);

CREATE TABLE events(
    title TEXT NOT NULL,
    start TEXT NOT NULL,
    end TEXT NOT NULL,
    occupied TEXT
)


