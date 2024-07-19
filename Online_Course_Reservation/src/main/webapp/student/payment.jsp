<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Payment</title>
    <%@include file="../component/allCss.jsp" %>
    <!-- Add your CSS styles here -->
    <style>
        /* Add your custom styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            
           
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .amount-label {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
      <%@include file="../student/navbarStudent.jsp" %>

    <div class="container p-5">
        <h2>Payment</h2>
        <p>Please enter the amount to proceed with the payment:</p>
       
        <p class="amount-label">Amount: <%= request.getParameter("course_amount") %></p>
        <form action="../RegisterCourse" method="post">
            <div class="form-group">
                <label for="amount">Enter Amount:</label>
                <input type="number" id="amount" name="amount" required>
            </div>
            
            <input type="hidden" id="course_id" name="course_id" value="<%= request.getParameter("course_id") %>">
             <input type="hidden" id="course_id" name="teacher_id" value="<%= request.getParameter("teacher_id") %>">
             <input type="hidden" id="course_id" name="student_id" value="<%= request.getParameter("student_id") %>">
            <input type="hidden" id="course_amount" name="course_amount" value="<%= request.getParameter("course_amount") %>">
            <input type="submit" value="Pay Now">
        </form>
    </div>
</body>
</html>
