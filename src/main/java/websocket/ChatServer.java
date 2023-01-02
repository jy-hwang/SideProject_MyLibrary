package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//ws ://host:port/contextRoot/ChatingServer
@ServerEndpoint("/ChatingServer")
public class ChatServer {

	public static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹 소켓 연결 : " + session.getId());
	}

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {

		System.out.println("메시지 전송 : " + session.getId() + " : " + message);
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹 소캣 종료 : " + session.getId());
	}

	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}

}