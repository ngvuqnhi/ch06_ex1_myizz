package murach.email;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeParseException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import murach.business.User;

@WebServlet("/emailList")
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Hiển thị form
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null || action.equals("join")) {
            doGet(req, resp);
            return;
        }

        String email = trim(req.getParameter("email"));
        String first = trim(req.getParameter("firstName"));
        String last  = trim(req.getParameter("lastName"));
        String dob   = trim(req.getParameter("dob"));

        String message = null;

        // Validate bắt buộc
        if (email.isEmpty() || first.isEmpty() || last.isEmpty() || dob.isEmpty()) {
            message = "All fields are required.";
        } else {
            try {
                LocalDate today = LocalDate.now(ZoneId.systemDefault());
                LocalDate dobDate = LocalDate.parse(dob);          // yyyy-MM-dd
                if (dobDate.isAfter(today)) {                      // ❌ tương lai không cho
                    message = "Date of birth must be today or earlier.";
                }
            } catch (DateTimeParseException e) {
                message = "Invalid date format (yyyy-MM-dd).";
            }
        }

        if (message != null) {
            User user = new User();
            user.setEmail(email);
            user.setFirstName(first);
            user.setLastName(last);
            user.setDob(dob);

            req.setAttribute("user", user);
            req.setAttribute("message", message);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        // OK -> tạo/lưu user và forward thanks.jsp
        User user = new User(email, first, last, dob);
        req.setAttribute("user", user);
        getServletContext().getRequestDispatcher("/thanks.jsp").forward(req, resp);
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
}
