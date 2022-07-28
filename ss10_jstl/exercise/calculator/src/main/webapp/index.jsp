<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/28/2022
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Calculator</h1>
  <form action="/calculator" method="post">
    <input type="text" name="first_operand" placeholder="Nhập số thứ nhất">
    <div>
      <span>Nhập toán hạng</span>
      <select name="Operator">
        <option value="+">addition</option>
        <option value="-">subtraction</option>
        <option value="*">multiplication</option>
        <option value="/">division</option>
      </select>
    </div>
    <input  type="text" name="second_operand" placeholder="Nhập số thứ hai">
    <button type="submit">Calculate</button>

  </form>

  </body>
</html>
