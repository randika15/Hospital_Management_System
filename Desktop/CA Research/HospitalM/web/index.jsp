<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <%@include file="component/allcss.jsp"%>

    <style>
        .hero-banner {
            background: url('img/hos1.jpg') no-repeat center center;
            background-size: cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 2.5rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }

        .paint-card {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .paint-card:hover {
            transform: translateY(-5px);
        }

        .team-img {
            border-radius: 10px;
            object-fit: cover;
        }

        .section-title {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1rem;
            text-align: center;
        }

        hr {
            margin-top: 3rem;
            margin-bottom: 3rem;
        }
    </style>
</head>

<body>
    <%@include file="component/navbar.jsp"%>

    <!-- Hero Banner -->
    <div class="hero-banner">
        Welcome to Our Hospital
    </div>

    <!-- Key Features -->
    <div class="container mt-5">
        <p class="section-title">Key Features of Our Hospital</p>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card paint-card h-100">
                    <div class="card-body">
                        <h5 class="card-title">100% Safety</h5>
                        <p class="card-text">Re-engineer hospital discharges, limit staff shift durations for optimal safety and care.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card paint-card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Clean Environment</h5>
                        <p class="card-text">Utilize robotics, NHS best practices, and color-coded cleaning zones to maintain hygiene.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card paint-card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Friendly Doctors</h5>
                        <p class="card-text">Our skilled team of doctors and support staff is committed to extraordinary patient care.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card paint-card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Medical Research</h5>
                        <p class="card-text">Engaged in continuous research to improve treatments and advance medical science.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Image Section -->
    

    <hr>

    <!-- Our Team -->
    <div class="container mt-5">
        <p class="section-title">Meet Our Team</p>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card paint-card h-100">
                    <div class="card-body text-center">
                        <img src="img/doc2.jpg" class="img-fluid team-img mb-3" width="200" height="250">
                        <h5 class="card-title">DR. BANDULA WIJESIRIWARDENA</h5>
                        <p class="text-muted">(CEO & CHAIRMAN)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card paint-card h-100">
                    <div class="card-body text-center">
                        <img src="img/doc5.jpg" class="img-fluid team-img mb-3" width="200" height="250">
                        <h5 class="card-title">DR. KANISHKA KARUNARATNE</h5>
                        <p class="text-muted">(CHIEF DOCTOR)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card paint-card h-100">
                    <div class="card-body text-center">
                        <img src="img/doc3.jpg" class="img-fluid team-img mb-3" width="200" height="250">
                        <h5 class="card-title">Dr. LAKSHMI KUMARI SANGAKKARA</h5>
                        <p class="text-muted">(CHIEF DOCTOR)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card paint-card h-100">
                    <div class="card-body text-center">
                        <img src="img/doc4.jpg" class="img-fluid team-img mb-3" width="200" height="250">
                        <h5 class="card-title">Dr. NADUN KUMARA FERNANDO</h5>
                        <p class="text-muted">(CHIEF DOCTOR)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="component/footer.jsp" %>
</body>
</html>
