package controller;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import db.Database;

/**
 * Servlet implementation class ChatEndpoint
 */
@ServerEndpoint("/chat/{chatRoomNumber}")
public class ChatEndpoint {
    private static final Set<Session> sessions = new CopyOnWriteArraySet<>();
    private String lastMessage = "";

    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
        Database database = new Database();
        new Thread(() -> {
            while (sessions.contains(session)) {
                try {
                    String message = database.lastMessage("1");
                    if(!message.equals(lastMessage)) {
                    	lastMessage = message;
                    	session.getBasicRemote().sendText(message);
                    }
                    Thread.sleep(5000);  // 5초마다 메시지를 보냅니다.
                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        for (Session s : sessions) {
            s.getBasicRemote().sendText(message);
        }
    }
}
