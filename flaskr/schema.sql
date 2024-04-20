DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS timeCards;
DROP TABLE IF EXISTS charts;
DROP TABLE IF EXISTS events;

-- ADD COLUMN IN USER FOR NAMES AND CHANGE SERVER ACCORDINGLY. ESPECIALLY WHEN CLOCKING IN AND OUT
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
    chart_id INTEGER,
    FOREIGN KEY (chart_id) REFERENCES user (id),
    resident   TEXT NOT NULL,
    roomNum    INTEGER,
    dateSigned TEXT NOT NULL

);

CREATE TABLE events(
    title TEXT NOT NULL,
    start TEXT NOT NULL,
    end TEXT NOT NULL,
    occupied TEXT
);

INSERT INTO user (username, password, type, CICO) VALUES ('admin','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');
INSERT INTO user (username, password, type, CICO) VALUES ('tony','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');
INSERT INTO user (username, password, type, CICO) VALUES ('elizabeth','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');
INSERT INTO user (username, password, type, CICO) VALUES ('jeremiah','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');
INSERT INTO user (username, password, type, CICO) VALUES ('spongebob','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');
INSERT INTO user (username, password, type, CICO) VALUES ('peppapig','pbkdf2:sha256:600000$2mrun2W8sF5nnUe7$c3bd404bbf21009ea67fa381212b738c3637e82b6bf0074fa30b24995e661fff','admin','CO');

INSERT INTO timeCards(time_id, name, house, dayNum, CICO, timeIndex, CIDay, CODay, CItime, COtime) VALUES (0,'tony','rhode island',3102024,'CO',0,'03/10/2024','03/10/2024','9:58:50 pm','9:59:58 pm');
INSERT INTO timeCards(time_id, name, house, dayNum, CICO, timeIndex, CIDay, CODay, CItime, COtime) VALUES (0,'tony','rhode island',3112024,'CO',0,'03/11/2024','03/12/2024','9:58:50 pm','1:59:58 am');
INSERT INTO timeCards(time_id, name, house, dayNum, CICO, timeIndex, CIDay, CODay, CItime, COtime) VALUES (0,'tony','rhode island',3132024,'CO',0,'03/11/2024','03/12/2024','9:58:50 pm','1:59:58 am');


INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'rhode island','03/10/2024', '03/10/2024','9:58:50 pm','9:59:58 pm',03102024,'CO',0,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'rhode island','03/11/2024', '03/12/2024','9:58:50 pm','1:59:58 am',03112024,'CO',1,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'sailor','03/13/2024', '03/13/2024','1:58:50 am','7:59:58 am',03132024,'CO',2,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'emerson','03/14/2024', '03/18/2024','1:58:50 am','7:59:58 am',03142024,'CO',3,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'decatur','03/19/2024', '03/19/2024','7:58:50 am','12:59:58 pm',03192024,'CO',4, 0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('elizabeth', 'decatur','03/19/2024', '03/19/2024','7:58:50 am','12:59:58 pm',03192024,'CO',5, 0);


INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'rhode island','04/10/2024', '04/10/2024','9:58:50 pm','9:59:58 pm',04102024,'CO',0,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'emerson','04/11/2024', '04/12/2024','9:58:50 pm','1:59:58 am',04112024,'CO',1,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'sailor','04/13/2024', '04/13/2024','1:58:50 am','7:59:58 am',04132024,'CO',2,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'rhode island','04/14/2024', '04/18/2024','1:58:50 am','7:59:58 am',04142024,'CO',3,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'decatur','04/19/2024', '04/19/2024','7:58:50 am','12:59:58 pm',04192024,'CO',4, 0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('jeremiah', 'decatur','04/19/2024', '04/19/2024','7:58:50 am','12:59:58 pm',04192024,'CO',5, 0);


INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'rhode island','05/10/2024', '05/10/2024','9:58:50 pm','9:59:58 pm',05102024,'CO',0,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'emerson','05/11/2024', '05/12/2024','9:58:50 pm','1:59:58 am',05112024,'CO',1,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'sailor','05/13/2024', '05/13/2024','1:58:50 am','7:59:58 am',05132024,'CO',2,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'rhode island','05/14/2024', '05/18/2024','1:58:50 am','7:59:58 am',05142024,'CO',3,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'decatur','05/19/2024', '05/19/2024','7:58:50 am','12:59:58 pm',05192024,'CO',4, 0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'decatur','05/19/2024', '05/19/2024','7:58:50 am','12:59:58 pm',05192024,'CO',5, 0);

INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'rhode island','06/10/2024', '06/10/2024','9:58:50 pm','9:59:58 pm',06102024,'CO',0,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'emerson','06/11/2024', '06/12/2024','9:58:50 pm','1:59:58 am',06112024,'CO',1,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'sailor','06/13/2024', '06/13/2024','1:58:50 am','7:59:58 am',06132024,'CO',2,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'rhode island','06/14/2024', '06/18/2024','1:58:50 am','7:59:58 am',06142024,'CO',3,0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'decatur','06/19/2024', '06/19/2024','7:58:50 am','12:59:58 pm',06192024,'CO',4, 0);
INSERT into timeCards(name,house,CIDay,CODay,CItime,COtime,dayNum,CICO,timeIndex, time_id) VALUES ('spongebob', 'decatur','06/19/2024', '06/19/2024','7:58:50 am','12:59:58 pm',06192024,'CO',5, 0);
