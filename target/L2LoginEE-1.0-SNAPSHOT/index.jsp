<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Prog Academy</title>
  </head>
  <body>
        <% String login = (String)session.getAttribute("user_login"); %>
        <% String age = (String)session.getAttribute("locked_age"); %>
        <% String mistake = (String)session.getAttribute("bad_login_or_password"); %>
        <% String mistakePass = (String)session.getAttribute("bad_password"); %>

        <%if (login == null && age==null) { %>
            <form action="/login" method="POST">
                Login: <label>
                <input type="text" name="login">
            </label><br>
                Password: <label>
                <input type="password" name="password">
            </label><br>
                Age:<label>
                <input type="text" name="age">
            </label><br>
                <input type="submit" />
            </form>
        <% }
            if (age!=null){%>
            <h1>You are not welcome because of your age</h1>
            <br>Please, refill your data to relogged if your
                age is more than 18 years old
            <form action="/login" method="POST">
                Login: <label>
                <input type="text" name="login">
            </label><br>
                Password: <label>
                <input type="password" name="password">
            </label><br>
                Age:<label>
                <input type="text" name="age">
            </label><br>
                <input type="submit" />
            </form>
        <% }
            if(age==null && login!=null) { %>
            <h1>You are welcome because of your age</h1>
            <h1>You are logged in as: <%= login %></h1>
            <br>Click this link to <a href="/login?a=exit">logout</a>
        <% }
            if(mistake!=null) { %>
            <h1>You are not welcome because of the password or the login is uncorrect
                <br> Please, refill your data to relogged</h1>
        <% }
            if(mistakePass!=null) { %>
            <h1>You are not welcome because of the password is less than 10 symbols
            <br>Please, refill your data to relogged</h1>
        <% } %>
  </body>
</html>