<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<%
    // Sample data to demonstrate dynamic rendering
    List<Map<String, String>> donations = (List<Map<String, String>>) session.getAttribute("donations");
    if (donations == null) {
        donations = new ArrayList<>();
        session.setAttribute("donations", donations);
    }

    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        Map<String, String> donation = new HashMap<>();
        donation.put("userName", request.getParameter("userName"));
        donation.put("email", request.getParameter("email"));
        donation.put("phone", request.getParameter("phone"));
        donation.put("foodName", request.getParameter("foodName"));
        donation.put("quantity", request.getParameter("quantity"));
        donation.put("expiryDate", request.getParameter("expiryDate"));
        donation.put("location", request.getParameter("location"));
        donations.add(donation);
        session.setAttribute("donations", donations);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waste Food Donation</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Waste Food Donation</h1>
        <p>Helping those in need by reducing food waste</p>
    </header>

    <main>
        <section id="donation-form">
            <h2>Donate Food</h2>
            <form action="index.jsp" method="post">
                <label for="userName">Your Name:</label>
                <input type="text" id="userName" name="userName" placeholder="Enter your name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

                <label for="foodName">Food Name:</label>
                <input type="text" id="foodName" name="foodName" placeholder="Enter food name" required>

                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" placeholder="Enter quantity" required>

                <label for="expiryDate">Expiry Date:</label>
                <input type="date" id="expiryDate" name="expiryDate" required>

                <label for="location">Pickup Location:</label>
                <input type="text" id="location" name="location" placeholder="Enter pickup location" required>

                <button type="submit">Donate Now</button>
            </form>
        </section>

        <section id="donation-list">
            <h2>Food Donations</h2>
            <c:choose>
                <c:when test="${not empty donations}">
                    <ul>
                        <c:forEach var="donation" items="${donations}">
                            <li>
                                <strong>Donor:</strong> ${donation.userName}<br>
                                <strong>Email:</strong> ${donation.email}<br>
                                <strong>Phone:</strong> ${donation.phone}<br>
                                <strong>Food:</strong> ${donation.foodName}<br>
                                <strong>Quantity:</strong> ${donation.quantity}<br>
                                <strong>Expiry Date:</strong> ${donation.expiryDate}<br>
                                <strong>Pickup Location:</strong> ${donation.location}
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>No donations available yet. Be the first to donate!</p>
                </c:otherwise>
            </c:choose>
        </section>
    </main>
</body>
</html>
