<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MediCare Hospital | Home</title>
        <%@include file="component/allcss.jsp"%>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-color: #2a9d8f;
                --secondary-color: #264653;
                --accent-color: #e9c46a;
                --light-color: #f8f9fa;
                --dark-color: #343a40;
            }

            body {
                font-family: 'Poppins', sans-serif;
                overflow-x: hidden;
            }

            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('img/hos1.jpg');
                background-size: cover;
                background-position: center;
                color: white;
                padding: 120px 0;
                text-align: center;
                margin-bottom: 50px;
            }

            .hero-title {
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 20px;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            }

            .hero-subtitle {
                font-size: 1.5rem;
                margin-bottom: 30px;
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
            }

            .feature-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                border: none;
                border-radius: 10px;
                overflow: hidden;
                margin-bottom: 20px;
                height: 100%;
            }

            .feature-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            }

            .feature-icon {
                font-size: 2.5rem;
                color: var(--primary-color);
                margin-bottom: 15px;
            }

            .section-title {
                position: relative;
                display: inline-block;
                margin-bottom: 50px;
                font-weight: 600;
                color: var(--secondary-color);
            }

            .section-title:after {
                content: '';
                position: absolute;
                width: 50%;
                height: 3px;
                background: var(--accent-color);
                bottom: -10px;
                left: 25%;
            }

            .doctor-card {
                transition: all 0.3s ease;
                border: none;
                border-radius: 10px;
                overflow: hidden;
                text-align: center;
                margin-bottom: 30px;
            }

            .doctor-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            }

            .doctor-img {
                width: 100%;
                height: 300px;
                object-fit: cover;
                border-bottom: 3px solid var(--accent-color);
            }

            .btn-custom {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 10px 25px;
                border-radius: 50px;
                transition: all 0.3s ease;
            }

            .btn-custom:hover {
                background-color: var(--secondary-color);
                color: white;
                transform: translateY(-3px);
            }

            .cta-section {
                background-color: var(--secondary-color);
                color: white;
                padding: 80px 0;
                margin: 50px 0;
                position: relative;
            }



            .stats-item {
                text-align: center;
                padding: 20px;
            }

            .stats-number {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--primary-color);
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp"%>

        <!-- Hero Section -->
        <div class="hero-section">
            <div class="container">
                <h1 class="hero-title">Your Health Is Our Priority</h1>
                <p class="hero-subtitle">Providing compassionate, high-quality healthcare services to our community for over 25 years.</p>
                <a href="user_appoinment.jsp" class="btn btn-custom btn-lg">Book an Appointment</a>
            </div>
        </div>

        <!-- Features Section -->
        <div class="container py-5">
            <h2 class="text-center section-title">Why Choose Our Hospital</h2>

            <div class="row">
                <div class="col-md-3">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h4>100% Safety</h4>
                            <p>Our hospital maintains the highest safety standards with advanced protocols and continuous staff training.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-broom"></i>
                            </div>
                            <h4>Clean Environment</h4>
                            <p>State-of-the-art sterilization and cleaning procedures ensure a hygienic environment for all patients.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-user-md"></i>
                            </div>
                            <h4>Expert Doctors</h4>
                            <p>Our team of board-certified physicians provides personalized care with compassion and expertise.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-flask"></i>
                            </div>
                            <h4>Advanced Research</h4>
                            <p>Pioneering medical research to bring the latest treatments and technologies to our patients.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Section -->
        <div class="container-fluid py-5" style="background-color: #f8f9fa;">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 stats-item">
                        <div class="stats-number">25+</div>
                        <h5>Years Experience</h5>
                    </div>
                    <div class="col-md-3 stats-item">
                        <div class="stats-number">150+</div>
                        <h5>Expert Doctors</h5>
                    </div>
                    <div class="col-md-3 stats-item">
                        <div class="stats-number">50,000+</div>
                        <h5>Happy Patients</h5>
                    </div>
                    <div class="col-md-3 stats-item">
                        <div class="stats-number">24/7</div>
                        <h5>Emergency Service</h5>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctors Section -->
        <div class="container py-5">
            <h2 class="text-center section-title">Meet Our Specialists</h2>

            <div class="row">
                <div class="col-md-3">
                    <div class="card doctor-card">
                        <img src="img/doc2.jpg" class="doctor-img" alt="Dr. Bandula Wijesiriwardena">
                        <div class="card-body">
                            <h5 class="card-title">DR. BANDULA WIJESIRIWARDENA</h5>
                            <p class="text-muted">CEO & CHAIRMAN</p>
                            <p class="card-text">Cardiologist with 30 years of experience in heart care.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card doctor-card">
                        <img src="img/doc5.jpg" class="doctor-img" alt="Dr. Kanishka Karunaratne">
                        <div class="card-body">
                            <h5 class="card-title">DR. KANISHKA KARUNARATNE</h5>
                            <p class="text-muted">CHIEF DOCTOR</p>
                            <p class="card-text">Neurologist specializing in stroke prevention and treatment.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card doctor-card">
                        <img src="img/doc3.jpg" class="doctor-img" alt="Dr. Lakshmi Kumari Sangakkara">
                        <div class="card-body">
                            <h5 class="card-title">DR. LAKSHMI KUMARI SANGAKKARA</h5>
                            <p class="text-muted">CHIEF DOCTOR</p>
                            <p class="card-text">Pediatrician dedicated to children's health and wellness.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card doctor-card">
                        <img src="img/doc4.jpg" class="doctor-img" alt="Dr. Nadun Kumara Fernando">
                        <div class="card-body">
                            <h5 class="card-title">DR. NADUN KUMARA FERNANDO</h5>
                            <p class="text-muted">CHIEF DOCTOR</p>
                            <p class="card-text">Orthopedic surgeon specializing in joint replacements.</p>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <%@include file="component/footer.jsp" %>

        <!-- Font Awesome for icons -->
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </body>
</html> 