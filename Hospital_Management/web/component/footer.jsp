<style>
    .med-footer {
        background: linear-gradient(135deg, var(--medical-blue) 0%, var(--doctor-green) 100%) !important;
        color: white;
        padding: 1.5rem 0;
        margin-top: 3rem;
        box-shadow: 0 -5px 15px rgba(0,0,0,0.1);
    }

    .footer-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .footer-logo {
        font-size: 1.2rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
    }

    .footer-logo i {
        margin-right: 10px;
        font-size: 1.5rem;
    }

    .footer-copyright {
        font-size: 0.9rem;
        opacity: 0.9;
    }

    .footer-links {
        display: flex;
        gap: 1.5rem;
        margin-top: 1rem;
    }

    .footer-link {
        color: white;
        opacity: 0.8;
        transition: opacity 0.3s;
        text-decoration: none;
    }

    .footer-link:hover {
        opacity: 1;
        text-decoration: underline;
    }

    .social-icons {
        display: flex;
        gap: 1rem;
        margin-top: 1rem;
    }

    .social-icon {
        color: white;
        font-size: 1.2rem;
        opacity: 0.8;
        transition: all 0.3s;
    }

    .social-icon:hover {
        opacity: 1;
        transform: translateY(-3px);
    }
</style>

<footer class="med-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-logo">
                <i class="fa-solid fa-house-medical"></i>
                <span>MEDI HOME</span>
            </div>
            <div class="footer-copyright">
                &copy; 2023 hospital.com. All rights reserved.
            </div>

            <div class="social-icons">
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
</footer>