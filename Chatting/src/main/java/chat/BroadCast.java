package chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//@ServerEndpoint는 클라이언트에서 서버로 접속 할 주소로 지정합니다.
@ServerEndpoint("/broadcasting")
public class BroadCast{

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

	//클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		synchronized (clients) { // Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	//서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수
	//세션에 추가
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}

	//접속이 끊겼을때 처리입니다.
	@OnClose
	public void onClose(Session session) {
		//세션에서 삭제
		clients.remove(session);
	}

}