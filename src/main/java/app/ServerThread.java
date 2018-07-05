package app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ServerThread extends Thread {
    private Socket socket;
    private Database database;

    public ServerThread(Socket socket) {
        System.out.println("New connection from " + socket.getInetAddress().getHostAddress());
        this.socket = socket;
        this.database = Database.getInstance();
    }

    @Override
    public void run() {
        try (PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {
            String input, output;

            while ((input = in.readLine()) != null) {
                if (input.equals("next number")) {
                    output = String.valueOf(database.getNextNumber());
                    out.println(output);
                } else if (input.equals("close")) {
                    out.println("closing");
                    break;
                } else {
                    out.println("type 'next number' to get next number\n" +
                            "type 'close' to close connection");
                }
            }
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
