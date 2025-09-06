<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/includes/header.html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="page">
    <div class="card">
        <h1 class="title">Join our email list</h1>
        <p class="subtitle">To join our email list, enter your name and email address below.</p>

        <c:if test="${message != null}">
            <div class="alert">${message}</div>
        </c:if>

        <form action="emailList" method="post" class="form">
            <input type="hidden" name="action" value="add"/>

            <div class="field">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" value="${user.email}" required/>
            </div>

            <div class="field">
                <label for="firstName">First Name</label>
                <input id="firstName" type="text" name="firstName" value="${user.firstName}" required/>
            </div>

            <div class="field">
                <label for="lastName">Last Name</label>
                <input id="lastName" type="text" name="lastName" value="${user.lastName}" required/>
            </div>

            <!-- DOB: chỉ cho phép ≤ hôm nay -->
            <div class="field">
                <label for="dob">Date of Birth</label>
                <input id="dob" type="date" name="dob" value="${user.dob}" required/>
            </div>

            <button type="submit" class="btn-primary">Join Now</button>
        </form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.querySelector('form[action="emailList"]');
        if (!form) return;

        const dobInput = form.querySelector('#dob');
        const btn = form.querySelector('.btn-primary');

        // Set max = hôm nay (cho phép chọn quá khứ, chặn tương lai)
        const today = new Date().toISOString().split('T')[0];
        dobInput.setAttribute('max', today);
        // Nếu muốn set mốc nhỏ nhất: dobInput.setAttribute('min','1900-01-01');

        // Khi submit: chuyển nút sang trạng thái loading xanh trong
        form.addEventListener('submit', function () {
            btn.classList.add('loading');
            btn.setAttribute('disabled', 'disabled');
            btn.textContent = 'Joining...';
        });
    });
</script>

<%@ include file="/includes/footer.jsp" %>
