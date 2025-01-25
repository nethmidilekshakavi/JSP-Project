<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - RFastion</title>
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
    }

    h2 {
      color: #555;
      font-size: 1.5em;
      margin-top: 20px;
    }

    p {
      color: #666;
      line-height: 1.6;
    }

    .team {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      margin-top: 20px;
    }

    .team-member {
      background-color: #fafafa;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      width: 30%;
      margin: 10px 0;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .team-member h3 {
      margin-top: 0;
      color: #333;
    }

    .team-member p {
      color: #777;
    }

    @media screen and (max-width: 600px) {
      .team-member {
        width: 100%;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>About Us</h1>
  <h2>Our Story</h2>
  <p>
    At RFastion, we believe in making your shopping experience seamless and enjoyable. Founded in [Year], our mission has always been to provide high-quality products at competitive prices, with exceptional customer service.
  </p>
  <h2>Our Values</h2>
  <p><strong>Customer First:</strong> We prioritize our customers' needs and strive to exceed their expectations.</p>
  <p><strong>Quality:</strong> We only offer products that meet our high standards of quality and durability.</p>
  <p><strong>Sustainability:</strong> We are committed to sustainable practices to minimize our environmental impact.</p>
  <p><strong>Innovation:</strong> We continuously innovate to bring you the latest trends and technologies.</p>
  <h2>Meet Our Team</h2>
  <div class="team">
    <div class="team-member">
      <h3>[MIS.T.K.N.D.KAVINDI]</h3>
      <p>Founder and CEO, with a passion for e-commerce and customer satisfaction.</p>
    </div>
    <div class="team-member">
      <h3>[MR.PERERA]</h3>
      <p>Head of Operations, ensuring smooth and efficient processes.</p>
    </div>
    <div class="team-member">
      <h3>[MIS.Yajawickrama]</h3>
      <p>Marketing Director, driving our brand's growth and engagement.</p>
    </div>
  </div>
  <h2>Our Promise</h2>
  <p>
    At RFastion, we promise to deliver exceptional products, outstanding service, and a shopping experience that keeps you coming back. Join us on our journey and be a part of our growing community.
  </p>
</div>
</body>
</html>
