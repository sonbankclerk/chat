CREATE DATABASE chatdb;
CREATE USER 'chat'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON chatdb.* TO 'chat'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE ChatRoomMembers;
DROP TABLE ChatRooms;
DROP TABLE ChatHistory;
DROP TABLE Users;
-- 사용자 정보를 저장하는 테이블
CREATE TABLE Users (
    ID VARCHAR(20) PRIMARY KEY,
    Password VARCHAR(20) NOT NULL,
    Name VARCHAR(50) NOT NULL
);
-- 채팅 기록을 저장하는 테이블
CREATE TABLE ChatHistory (
	MessageID INT AUTO_INCREMENT PRIMARY KEY,
    ChatRoomNumber INT NOT NULL,
    ID VARCHAR(20) NOT NULL,
    Message TEXT,
    FOREIGN KEY (ID) REFERENCES Users(ID)
);

-- 채팅방을 식별하는 테이블
CREATE TABLE ChatRooms (
    ChatRoomNumber INT AUTO_INCREMENT PRIMARY KEY,
    RoomName VARCHAR(50) NOT NULL
);
-- 채팅방에 누가 소속되어 있는지 저장하는 테이블
CREATE TABLE ChatRoomMembers (
    ID VARCHAR(20) NOT NULL,
    ChatRoomNumber INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES Users(ID),
    FOREIGN KEY (ChatRoomNumber) REFERENCES ChatRooms(ChatRoomNumber)
);
SELECT * FROM ChatHistory;
INSERT INTO USERs (ID, PASSWORD, name) VALUES("admin", "1111", "관리자");
INSERT INTO USERs (ID, PASSWORD, name) VALUES("test", "1111", "테스트");
INSERT INTO ChatRooms (RoomName) VALUES("문의");
INSERT INTO ChatRoomMembers (ID, ChatRoomNumber) VALUES("admin", 1);
INSERT INTO ChatRoomMembers (ID, ChatRoomNumber) VALUES("test", 1);
INSERT INTO ChatHistory ( ChatRoomNumber, ID, Message) VALUES(1, "admin", "안녕");