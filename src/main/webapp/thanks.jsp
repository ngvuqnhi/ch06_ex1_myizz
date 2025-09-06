<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/includes/header.html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="hero">
    <div class="glass">
        <div class="brand">
            <div class="dot dot--ok"></div>
            <h1>You're on the list! 🎉</h1>
            <p>Thanks for joning. Here’s what we got:</p>
        </div>

        <div class="summary">
            <div><b>Email</b><span>${user.email}</span></div>
            <div><b>First name</b><span>${user.firstName}</span></div>
            <div><b>Last name</b><span>${user.lastName}</span></div>
            <div><b>Date of birth</b><span>${user.dob}</span></div>
        </div>

        <form action="" method="post">
            <input type="hidden" name="action" value="join"/>
            <button class="btn ghost" type="submit"><span class="btn__label">Return</span></button>
        </form>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>
