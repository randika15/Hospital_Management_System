<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Participants List</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #2f3542, #57606f);
            padding: 50px 20px;
            color: #f1f2f6;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #f1f2f6;
            font-size: 30px;
            font-weight: 600;
        }

        .table-container {
            max-width: 1000px;
            margin: 0 auto;
            background: #2d3436;
            padding: 35px 30px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 16px 18px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: #00cec9;
            color: #2d3436;
            font-size: 15px;
        }

        td {
            font-size: 14px;
            color: #dfe6e9;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            text-decoration: none;
            color: #00cec9;
            font-weight: 600;
            transition: 0.3s;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h1>Registered Participants</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Event</th>
            </tr>
            <c:forEach var="participant" items="${participantList}">
                <tr>
                    <td><c:out value="${participant.id}" /></td>
                    <td><c:out value="${participant.name}" /></td>
                    <td><c:out value="${participant.email}" /></td>
                    <td><c:out value="${participant.event}" /></td>
                </tr>
            </c:forEach>
        </table>
        <div class="back-link">
            <a href="new">← Register New Participant</a>
        </div>
    </div>
</body>
</html>
