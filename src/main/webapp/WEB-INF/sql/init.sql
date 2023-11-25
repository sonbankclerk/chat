CREATE DATABASE chatdb;
CREATE USER 'chat'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON chatdb.* TO 'chat'@'%';
FLUSH PRIVILEGES;

DROP TABLE ChatRoomMembers;
DROP TABLE ChatRooms;
DROP TABLE ChatHistory;
DROP TABLE Users;
CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE chatRooms (
    chatRoomNumber INT AUTO_INCREMENT PRIMARY KEY,
    roomName VARCHAR(50) NOT NULL
);
CREATE TABLE chatHistory (
	messageID INT AUTO_INCREMENT PRIMARY KEY,
    chatRoomNumber INT NOT NULL,
    id VARCHAR(20) NOT NULL,
    message TEXT,
    FOREIGN KEY (id) REFERENCES users(id)
);
CREATE TABLE chatRoomMembers (
    id VARCHAR(20) NOT NULL,
    chatRoomNumber INT NOT NULL,
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (chatRoomNumber) REFERENCES chatRooms(chatRoomNumber)
);
SELECT * FROM ChatHistory;
INSERT INTO USERs (ID, PASSWORD, name) VALUES("admin", "1111", "관리자");
INSERT INTO USERs (ID, PASSWORD, name) VALUES("test", "1111", "테스트");
INSERT INTO ChatRooms (RoomName) VALUES("문의");
INSERT INTO ChatRoomMembers (ID, ChatRoomNumber) VALUES("admin", 1);
INSERT INTO ChatRoomMembers (ID, ChatRoomNumber) VALUES("test", 1);
INSERT INTO ChatHistory ( ChatRoomNumber, ID, Message) VALUES(1, "admin", "안녕");