<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/includes/header.html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page">
    <div class="card">
        <h1 class="title">Thanks for joining our email list 🎉</h1>
        <p class="subtitle">Here is the information that you entered:</p>

        <div class="info">
            <div><label>Email:</label> <span>${user.email}</span></div>
            <div><label>First Name:</label> <span>${user.firstName}</span></div>
            <div><label>Last Name:</label> <span>${user.lastName}</span></div>
            <div><label>Date of Birth:</label> <span>${user.dob}</span></div>
        </div>

        <form action="" method="post">
            <input type="hidden" name="action" value="join">
            <button type="submit" class="btn-primary">Return</button>
        </form>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>
