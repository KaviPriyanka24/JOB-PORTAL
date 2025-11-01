<%
    // ✅ Destroy current session completely
    if (session != null) {
        session.invalidate();
    }

    // ✅ Prevent browser from caching protected pages
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);

    // ✅ Redirect to login page
    response.sendRedirect("index.jsp");
%>
