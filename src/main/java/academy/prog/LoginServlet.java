package academy.prog;

import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    static final String LOGIN = "admin";
    static final String PASS = "qazwsx1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String mistakeInLogOrPass="mistakeInLogOrPass";
        String mistakeInPass="mistakeInPass";
        int ageInt=Integer.parseInt(age);

        if (LOGIN.equals(login) && PASS.equals(password)) {
            HttpSession session = request.getSession(true);

            if(ageInt>=18){
                session.setAttribute("user_login", login);
                session.removeAttribute("locked_age");
            }
            else{
                session.setAttribute("locked_age", age);

            }
            session.removeAttribute("bad_login_or_password");
            session.removeAttribute("bad_password");

        }
        else{
            HttpSession session = request.getSession(false);
            if(password.length()>=10)
                session.setAttribute("bad_login_or_password", mistakeInLogOrPass);
            else
                session.setAttribute("bad_password",  mistakeInPass);

            session.removeAttribute("user_login");
            session.removeAttribute("locked_age");

            }

        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String a = request.getParameter("a");
        HttpSession session = request.getSession(false);

        if ("exit".equals(a) && (session != null)){
            session.removeAttribute("user_login");
            session.removeAttribute("locked_age");
            session.removeAttribute("bad_login_or_password");
            session.removeAttribute("bad_password");
        }

        response.sendRedirect("index.jsp");
    }
}
