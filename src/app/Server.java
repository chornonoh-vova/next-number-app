package app;

import java.io.IOException;
import java.net.ServerSocket;
import java.sql.SQLException;

public class Server {
    public static void main(String[] args) {
        int portNumber = Integer.parseInt(args[0]);
        boolean listening = true;

        System.out.println("Server started");

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                Database.getInstance().close();
                System.out.println("Connection to DB closed, quiting server");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }));

        try (ServerSocket ss = new ServerSocket(portNumber)) {
            while (listening) {
                System.out.println("Listening in " + portNumber + " for next connection");
                new ServerThread(ss.accept()).start();
            }
        } catch (IOException e) {
            System.err.println("Could not listen on port: " + portNumber);
            System.exit(-1);
        }
    }
}
