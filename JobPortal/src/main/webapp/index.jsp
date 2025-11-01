<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart Job Portal | Welcome</title>

<style>
    *{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}

    body{
        background-color:#f4f6f8;
        height:100vh;
        display:flex;
        flex-direction:column;
    }

    /* ---------- NAVBAR ---------- */
    .navbar{
        width:100%;
        padding:18px 50px;
        display:flex;
        justify-content:space-between;
        align-items:center;
        background:rgba(10,37,64,0.9);
        color:white;
        position:fixed;
        top:0;
        left:0;
        z-index:10;
    }
    .navbar .logo{
        font-size:24px;
        font-weight:600;
    }
    .navbar a{
        color:white;
        text-decoration:none;
        margin-left:25px;
        font-weight:500;
        transition:0.3s;
    }
    .navbar a:hover{ color:#4ea8de; }

    /* ---------- HERO SECTION ---------- */
    .hero{
        flex:1;
        display:flex;
        align-items:center;
        justify-content:space-between;
        padding:120px 80px 60px;
    }
    .hero-text{ max-width:50%; }
    .hero h1{
        font-size:42px;
        color:#0a2540;
        font-weight:700;
        margin-bottom:15px;
    }
    .hero p{
        font-size:18px;
        color:#333;
        line-height:1.6;
        margin-bottom:25px;
    }
    .hero-buttons a{
        display:inline-block;
        padding:12px 28px;
        font-size:16px;
        border-radius:8px;
        margin-right:15px;
        text-decoration:none;
        font-weight:600;
        transition:0.3s ease;
    }
    .login-btn{ background:#0a2540; color:white; }
    .login-btn:hover{ background:#4ea8de; }
    .register-btn{
     background:#0a2540;
     color:white; }
    .register-btn:hover{ 
  background:#4ea8de; }

    /* ---------- RIGHT IMAGE ---------- */
    .hero-image{
        flex:1;
        display:flex;
        justify-content:center;
        align-items:center;
    }
    .hero-image img{
        width:420px;
        border-radius:14px;
        border:4px solid #0a2540;
        box-shadow:0 0 18px rgba(10,37,64,0.55);
        transition:transform 0.4s ease, box-shadow 0.4s ease;
    }
    .hero-image img:hover{
        box-shadow:0 0 30px rgba(10,37,64,0.75);
    }

    /* ---------- FOOTER ---------- */
    .footer{
        background:#0a2540;
        color:white;
        text-align:center;
        padding:18px;
        font-size:14px;
        margin-top:auto;
        box-shadow:0 -4px 10px rgba(0,0,0,0.1);
    }

    /* ---------- MOBILE FIX ---------- */
    @media(max-width:900px){
        .hero{
            flex-direction:column;
            padding:140px 40px 40px;
            text-align:center;
        }
        .hero-text{
            max-width:100%;
            margin-bottom:30px;
        }
        .hero-image img{
            width:85%;
        }
    }
</style>
</head>

<body>

<!-- ✅ NAVBAR -->
<div class="navbar">
    <div class="logo">Smart Job Portal</div>
    <div>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

<!-- ✅ HERO SECTION -->
<div class="hero">

    <div class="hero-text">
        <h1>Your Dream Job Starts Here</h1>
        <p>
            Explore thousands of job opportunities, connect with top companies,
            and take the next step in your career journey.
        </p>

        <div class="hero-buttons">
            <a href="login.jsp" class="login-btn">Login</a>
            <a href="register.jsp" class="register-btn">Create Account</a>
        </div>
    </div>

    <div class="hero-image">
       <img src="https://i.ibb.co/d4rZW5HQ/professional.jpg" alt="professional">
    </div>

</div>

<!-- ✅ FOOTER -->
<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>
