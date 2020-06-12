DROP TABLE IF EXISTS PortInfo;
CREATE TABLE PortInfo (PortID INTEGER (3) PRIMARY KEY, PortName VARCHAR (30) NOT NULL, ConnectType VARCHAR (15) NOT NULL, ConnectMode VARCHAR (4) NOT NULL, ComName VARCHAR (5), BaudRate VARCHAR (6), TcpIP VARCHAR (16), TcpPort VARCHAR (10), ReadInterval VARCHAR (4) NOT NULL, ReadTimeout VARCHAR (4) NOT NULL);

DROP TABLE IF EXISTS DeviceInfo;
CREATE TABLE DeviceInfo (DeviceID INTEGER (3) PRIMARY KEY NOT NULL, DeviceName VARCHAR (20) NOT NULL, DeviceAddr INTEGER (3) NOT NULL, GroupID INTEGER (3) NOT NULL, GroupName VARCHAR (20) NOT NULL, PortID INTEGER (3) NOT NULL, PortName VARCHAR (20) NOT NULL, TempUpper VARCHAR (5) NOT NULL, TempLimit VARCHAR (5) NOT NULL, TempValue VARCHAR (5) NOT NULL, TempSign VARCHAR (4) NOT NULL, DampUpper VARCHAR (5) NOT NULL, DampLimit VARCHAR (5) NOT NULL, DampValue VARCHAR (5) NOT NULL, DampSign VARCHAR (4) NOT NULL, SaveInterval VARCHAR (5) NOT NULL, DeviceType VARCHAR (10) NOT NULL, DeviceSound VARCHAR (15) NOT NULL);

DROP TABLE IF EXISTS GroupInfo;
CREATE TABLE GroupInfo (GroupID INTEGER (3) PRIMARY KEY, GroupName VARCHAR (20));
INSERT INTO GroupInfo (GroupID, GroupName) VALUES (1, '默认区域');

DROP TABLE IF EXISTS ServerInfo;
CREATE TABLE ServerInfo (ServerName VARCHAR (10) PRIMARY KEY NOT NULL, ReadInterval VARCHAR (4) NOT NULL, ServerDbType VARCHAR (10) NOT NULL, ServerIP VARCHAR (16) NOT NULL, ServerPort VARCHAR (5) NOT NULL, ServerDbName VARCHAR (16) NOT NULL, ServerUserName VARCHAR (25) NOT NULL, ServerUserPwd VARCHAR (25) NOT NULL);

DROP TABLE IF EXISTS DeviceLog;
CREATE TABLE DeviceLog (DeviceLogID INTEGER (8) PRIMARY KEY, DeviceID INTEGER (3), DeviceName VARCHAR (20), DeviceAddr INTEGER (3), GroupName VARCHAR (20), TempValue VARCHAR (5), DampValue VARCHAR (5), PowerValue INTEGER (1), SaveTime VARCHAR (19), Type VARCHAR (4), Remark VARCHAR (30));

DROP TABLE IF EXISTS DeviceLogTemp;
CREATE TABLE DeviceLogTemp (DeviceLogID INTEGER (8) PRIMARY KEY, DeviceID INTEGER (3), DeviceName VARCHAR (20), DeviceAddr INTEGER (3), GroupName VARCHAR (20), TempValue VARCHAR (5), DampValue VARCHAR (5), PowerValue INTEGER (1), SaveTime VARCHAR (19), LogCountAll INTEGER (5), LogCountNoRead INTEGER (5), Type VARCHAR (4));

DROP TABLE IF EXISTS SystemLog;
CREATE TABLE SystemLog (SystemLogID INTEGER (8) PRIMARY KEY, TriggerType VARCHAR (10), TriggerContent VARCHAR (30), UserName VARCHAR (10), TriggerTime VARCHAR (30));

DROP TABLE IF EXISTS AlarmLog;
CREATE TABLE AlarmLog (AlarmLogID INTEGER (8) PRIMARY KEY, DeviceID INTEGER (3), DeviceName VARCHAR (20), DeviceAddr INTEGER (3), GroupName VARCHAR (20), TriggerValue VARCHAR (5), Content VARCHAR (20), StartTime VARCHAR (19), EndTime VARCHAR (19), Remark VARCHAR (30));

DROP TABLE IF EXISTS AlarmLink;
CREATE TABLE AlarmLink (DeviceID INTEGER (3), DeviceName VARCHAR (20), DeviceAddr INTEGER (3), DoDeviceID INTEGER (3), DoDeviceName VARCHAR (20), DoDeviceAddr INTEGER (3));

DROP TABLE IF EXISTS UserInfo;
CREATE TABLE UserInfo (UserName VARCHAR (10) PRIMARY KEY, UserPwd VARCHAR (32), UserType VARCHAR (10));
INSERT INTO UserInfo (UserName, UserPwd, UserType) VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', '管理员');

DROP TABLE IF EXISTS TempSql;
CREATE TABLE TempSql (ID INTEGER PRIMARY KEY AUTOINCREMENT, StrSql VARCHAR (500) NOT NULL);

DROP TABLE IF EXISTS TempCmd;
CREATE TABLE TempCmd (ID INTEGER PRIMARY KEY AUTOINCREMENT, StrCmd VARCHAR (100) NOT NULL);

DROP INDEX IF EXISTS DeviceLogIndex;
CREATE INDEX DeviceLogIndex ON DeviceLog (DeviceLogID ASC, DeviceID, DeviceName, GroupName, SaveTime, Type);

DROP INDEX IF EXISTS SystemLogIndex;
CREATE INDEX SystemLogIndex ON SystemLog (SystemLogID ASC, TriggerType, TriggerTime);

DROP INDEX IF EXISTS AlarmLogIndex;
CREATE INDEX AlarmLogIndex ON AlarmLog (AlarmLogID DESC, DeviceID, DeviceName, GroupName, Content, StartTime, EndTime);