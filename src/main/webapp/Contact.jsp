<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - RFastion</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1b3a67, #9b59b6);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        .contact-info {
            margin-bottom: 20px;
        }

        .contact-info h2 {
            color: #555;
            font-size: 1.5em;
        }

        .contact-info p {
            color: #666;
            line-height: 1.6;
        }

        .contact-form {
            margin-top: 20px;
        }

        .contact-form h2 {
            color: #555;
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        .contact-form label {
            color: #333;
            font-weight: bold;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .contact-form button {
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .contact-form button:active {
            background-color: #3e8e41;
            transform: scale(1);
        }

        @media screen and (max-width: 600px) {
            .contact-form input,
            .contact-form textarea {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Contact Us</h1>
    <div class="contact-info">
        <h2>Get in Touch</h2>
        <p>If you have any questions or need assistance, feel free to reach out to us. We're here to help!</p>
        <p><strong>Email:</strong> support@rfashion.com</p>
        <p><strong>Phone:</strong> +1 (123) 456-7890</p>
        <p><strong>Address:</strong> 123 Fashion Street, Fashion City, FC 12345</p>
    </div>
    <div class="contact-form">
        <h2>Send Us a Message</h2>
        <form action="ContactServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>
</div>
</body>
</html>
