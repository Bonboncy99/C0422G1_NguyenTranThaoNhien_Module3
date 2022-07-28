import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer>customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Bon", LocalDate.parse("1999-11-23"),"Quang Tri","https://upload.wikimedia.org/wikipedia/vi/d/db/Yoshi_%28Nintendo_character%29.png"));
        customerList.add(new Customer("Ben", LocalDate.parse("1999-11-23"),"Quang Tri","https://upload.wikimedia.org/wikipedia/vi/d/db/Yoshi_%28Nintendo_character%29.png"));
        customerList.add(new Customer("Nhien", LocalDate.parse("1999-11-23"),"Quang Tri","https://upload.wikimedia.org/wikipedia/vi/d/db/Yoshi_%28Nintendo_character%29.png"));
        customerList.add(new Customer("CY", LocalDate.parse("1999-11-23"),"Quang Tri","https://upload.wikimedia.org/wikipedia/vi/d/db/Yoshi_%28Nintendo_character%29.png"));
        customerList.add(new Customer("Boncy", LocalDate.parse("1999-11-23"),"Quang Tri","https://upload.wikimedia.org/wikipedia/vi/d/db/Yoshi_%28Nintendo_character%29.png"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
