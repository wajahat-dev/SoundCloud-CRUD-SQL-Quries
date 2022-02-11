================================ Create tables
CREATE TABLE userAccount(
    UserID INT,
    Email VARCHAR(100) UNIQUE,
    UserPassword VARCHAR(20) NOT NULL,
    Gender CHAR(3), 
    Subscription INTEGER,
    CardNo VARCHAR(16) NOT NULL,
    PRIMARY KEY (UserID)
);


CREATE TABLE addressUser(
    UserID int REFERENCES userAccount(UserID) ON DELETE CASCADE,
    Street VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    PRIMARY KEY(UserID)
);
CREATE TABLE artist(
    ArtistID int PRIMARY KEY,
    ArtistName VARCHAR(100)
);
CREATE TABLE album(
    AlbumID int PRIMARY KEY,
    AlbumName VARCHAR(100),
    AlbumYear INTEGER,
    Genre VARCHAR(20)
);
CREATE TABLE release(
    AlbumID int REFERENCES album(AlbumID) ON DELETE CASCADE,
    ArtistID int REFERENCES artist(ArtistID) ON DELETE CASCADE,
    PRIMARY KEY(AlbumID, ArtistID)
);
CREATE TABLE song(
    SongID int,
    ArtistID int REFERENCES artist(ArtistID) ON DELETE CASCADE,
    AlbumID int REFERENCES album(AlbumID) ON DELETE CASCADE,
    Streams int DEFAULT 0,
    SongName VARCHAR(100),
    SongLength int,
    Genre VARCHAR(100),
    PRIMARY KEY(SongID)
);

CREATE TABLE follows(
    UserID int REFERENCES userAccount(UserID) ON DELETE CASCADE,
    ArtistID int REFERENCES artist(ArtistID) ON DELETE CASCADE,
    Followers int DEFAULT 0, 
    Followering int DEFAULT 0 
);


============================================ Update
UPDATE addressUser SET
   
    Street = '22',
    City ='karachi',
    Province ='sindh',
    PostalCode ='75235'
where  UserID = 072


UPDATE addressUser SET
   
    Street = '23',
    City ='karachi',
    Province ='sindh',
    PostalCode ='75635'
where  UserID = 006

================================================= Selection 

-- userAccount table 
SELECT UserID, Email, CardNo FROM userAccount WHERE Subscription = 2;
SELECT UserID, Email, Subscription FROM userAccount ORDER BY CardNo DESC;

-- addressUser table 
SELECT UserID, Street, City, Province, PostalCode FROM addressUser WHERE addressUser.City = 'karachi';

-- song table

SELECT ArtistID, AVG(Streams) as AVGStreem FROM song 
SELECT COUNT(SongID) as TotalSong, AlbumID FROM song 
SELECT DISTINCT genre FROM song;
SELECT Streams, ArtistID FROM song ORDER BY Streams DESC;
SELECT SongID, ArtistID, ALbumID, Streams, SongName, SongLength, Genre FROM song WHERE song.Genre = 'Pop';


-- follows table
SELECT UserID, ArtistID, followers, followering FROM follows WHERE follows.UserID = 006;

-- artist table
SELECT AlbumID, AlbumName, AlbumYear, Genre FROM album WHERE AlbumYear > 1982;

-- relational tables
SELECT ArtistName FROM artist WHERE EXISTS (SELECT Streams FROM song WHERE song.ArtistID = artist.ArtistID AND Streams > 1000);
SELECT ArtistID, ArtistName FROM artist WHERE artist.ArtistName = 'Michael Jackson';
SELECT Genre FROM album UNION SELECT Genre FROM song;


================================================================



INSERT INTO userAccount VALUES (
    006,
    'aliwajah2at021@gmail.com',
    '123',
    'M',
    1,
    4356789044445656
);
INSERT INTO userAccount VALUES (
    072,
    'azharuddin@gmail.com',
    '234',
    'M',
    2,
    4356789000000000
);



INSERT INTO addressUser VALUES(
    006,
    '23',
    'karachi',
    'sindh',
    '75635'
);
INSERT INTO addressUser VALUES(
    072,
    '22',
    'karachi',
    'sindh',
    '75235'
);


INSERT INTO follows VALUES(
    006,
    115687669,
    2,
    1
);
INSERT INTO follows VALUES(
    072,
    123753454,
    24,
    14
);


INSERT INTO artist VALUES(
    115687669,
    'Michael Jackson'
);
INSERT INTO artist VALUES(
    123753454,
    'Ed Sheeran'
);
INSERT INTO artist VALUES(
    115400888,
    'Arctic Monkeys'
);
INSERT INTO artist VALUES(
    878787878,
    'Justin Biber'
);

INSERT INTO album VALUES(
    220400999,
    'AM',
    2013,
    'Pop'
);
INSERT INTO album VALUES(
    758493120,
    'Album1',
    1987,
    'Hip hop'
);


INSERT INTO release VALUES (
    220876548,
    115687669
);
INSERT INTO release VALUES (
    220876544,
    123753454
);
INSERT INTO release VALUES (
    220400999,
    115400888
);
INSERT INTO release VALUES (
    758493120,
    878787878
);

INSERT INTO song VALUES (
    132984791,
    115687669,
    220400999,
    45132,
    'Billie Jean',
    312,
    'Pop'
);
INSERT INTO song VALUES (
    132984777,
    123753454,
    758493120,
    1553,
    'Barcelona',
    312,
    'Pop'
);
INSERT INTO song VALUES (
    132984779,
    123753454,
    220400999,
    1348,
    'Happier',
    289,
    'Pop'
);



============================================= Deletion
DROP TABLE FOLLOWS ;
DROP TABLE SONG ;
DROP TABLE RELEASE ;
DROP TABLE ALBUM ;
DROP TABLE ARTIST ;
DROP TABLE ADDRESSUSER ;
DROP TABLE USERACCOUNT ;