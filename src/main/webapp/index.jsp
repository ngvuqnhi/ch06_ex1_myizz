<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/includes/header.html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="hero">
    <div class="glass">
        <div class="brand">
            <div class="dot"></div>
            <h1>Join our email list</h1>
            <p>Get updates, tips, and goodies straight to your inbox.</p>
        </div>

        <c:if test="${message != null}">
            <div class="note error">${message}</div>
        </c:if>

        <form action="emailList" method="post" class="grid">
            <input type="hidden" name="action" value="add"/>

            <label class="field">
                <span>Email</span>
                <input type="email" name="email" value="${user.email}" required placeholder="you@example.com"/>
            </label>

            <label class="field">
                <span>First name</span>
                <input type="text" name="firstName" value="${user.firstName}" required placeholder="Jenny"/>
            </label>

            <label class="field">
                <span>Last name</span>
                <input type="text" name="lastName" value="${user.lastName}" required placeholder="Nguyen"/>
            </label>

            <label class="field">
                <span>Date of birth</span>
                <input id="dob" type="date" name="dob" value="${user.dob}" required/>
            </label>

            <button class="btn coral" type="submit">
                <span class="btn__label">Join now</span>
            </button>
        </form>

        <p class="tiny">We respect your privacy. Unsubscribe anytime.</p>
    </div>
</div>

<script>
    // Giới hạn DOB: không lớn hơn hôm nay
    (function(){
        var i = document.getElementById('dob');
        if(!i) return;
        // VN timezone để tránh lệch ngày
        var tzDate = new Date().toLocaleDateString('en-CA', { timeZone: 'Asia/Ho_Chi_Minh' }); // yyyy-MM-dd
        i.setAttribute('max', tzDate);
    })();

    // Trạng thái loading cho nút
    (function(){
        var form = document.querySelector('form[action="emailList"]');
        if(!form) return;
        var btn = form.querySelector('.btn');
        form.addEventListener('submit', function(){
            btn.classList.add('is-loading');
            btn.setAttribute('disabled', 'disabled');
            btn.querySelector('.btn__label').textContent = 'Sending…';
        });
    })();
</script>

<%@ include file="/includes/footer.jsp" %>
