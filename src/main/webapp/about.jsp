<%-- 
    Document   : about
    Created on : Feb 19, 2024, 7:29:12 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
        <link rel="stylesheet" href="styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="/CSS/footer.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <style>
            .social-icon{
                width: 15px;
                height: 15px;
                object-fit: cover;
            }
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(to bottom, hsla(0, 80%, 40%, 0), hsla(0, 80%, 40%, 0.6));
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #ffccff;
                color: #fff;
                text-align: center;
                padding: 20px 0;
            }

            header h1 {
                margin: 0;
            }

            main {
                padding: 20px;
            }

            section {
                margin-bottom: 30px;
            }

            h2 {
                color: #333;
                text-align: center;
            }
            h2:hover, p:hover {
                color: #3333ff;
            }

            p {
                color: #666;
            }

            .team-members {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .team-member {
                flex: 1;
                text-align: center;
                margin-top: 20px;
            }

            .team-member img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }

            .team-member img:hover {
                transform: scale(1.1);
                transition: transform 0.3s ease;
            }


            footer {
                background-color: #ffccff;
                color: #fff;
                text-align: center;
                padding: 10px 0;
            }

        </style>
    </head>
    <body>
        <header>
            <h1>Header here</h1>
        </header>
        <main>
            <section>
                <h2>Introduce</h2>
                <p>Chúng tôi tự hào là điểm đến hàng đầu cho những ai đam mê nghệ thuật làm bánh và muốn trang bị cho mình những công cụ chất lượng và nguyên liệu tươi ngon nhất để thực hiện những ý tưởng sáng tạo nhất.</p>
            </section>
            <section>
                <h2>Our Team</h2>
                <div class="team-members">
                    <div class="team-member">
                        <img src="https://th.bing.com/th/id/OIP.yif1nrvGQSG1VsoQh3PSuQHaHa?rs=1&pid=ImgDetMain" alt="1">
                        <h4>Trần Phương Nam</h4>
                        <p>CE12345</p>
                    </div>
                    <div class="team-member">
                        <img src="https://th.bing.com/th/id/OIP.yif1nrvGQSG1VsoQh3PSuQHaHa?rs=1&pid=ImgDetMain" alt="2">
                        <h4>Nguyễn Hữu Thực</h4>
                        <p>CE12345</p>
                    </div>
                    <div class="team-member">
                        <img src="https://th.bing.com/th/id/OIP.yif1nrvGQSG1VsoQh3PSuQHaHa?rs=1&pid=ImgDetMain" alt="2">
                        <h4>Bùi Thị Mai Xuân</h4>
                        <p>CE12345</p>
                    </div>
                    <div class="team-member">
                        <img src="https://th.bing.com/th/id/OIP.yif1nrvGQSG1VsoQh3PSuQHaHa?rs=1&pid=ImgDetMain" alt="2">
                        <h4>Vũ Minh Uyên</h4>
                        <p>CE12345</p>
                    </div>
                    <div class="team-member">
                        <img src="https://th.bing.com/th/id/OIP.yif1nrvGQSG1VsoQh3PSuQHaHa?rs=1&pid=ImgDetMain" alt="2">
                        <h4>Đặng Nguyễn Đăng Khoa</h4>
                        <p>CE12345</p>
                    </div>

                </div>
            </section>

            <section>
                <h2>Our Story</h2>
                <p>Thành lập vào năm 2023, cửa hàng chúng tôi bắt nguồn từ niềm đam mê sâu sắc đối với nghệ thuật làm bánh và mong muốn chia sẻ niềm đam mê đó với cộng đồng. Bắt đầu từ một xưởng nhỏ, chúng tôi đã dần dần phát triển và trở thành điểm đến đáng tin cậy cho những ai yêu thích nghệ thuật làm bánh.
                    Suốt hành trình phát triển, chúng tôi không ngừng nỗ lực để cung cấp cho khách hàng những sản phẩm chất lượng và dịch vụ tốt nhất có thể. Chúng tôi luôn đặt sự hài lòng của khách hàng lên hàng đầu và luôn luôn lắng nghe và phản hồi ý kiến của họ để không ngừng cải thiện.</p>
            </section>
            <section id="location">
                <div class="container">
                    <h2>Our Location</h2>
                    <div id="map" style="text-align: center;" ><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.0533542569997!2d105.72985667464388!3d10.01245179009357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0882139720a77%3A0x3916a227d0b95a64!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgQ-G6p24gVGjGoQ!5e0!3m2!1sen!2s!4v1708303432314!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div> <!-- Your map goes here -->
                </div>
            </section>
        </main>
         <footer class="text-center text-lg-start text-white" style="background-color: #d5e3e4">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5 pt-2">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-4 col-xl-4 mx-auto mb-4">
                            <!-- Content -->
                            <!-- <h6 class="text-uppercase fw-bold">Company name</h6> -->
                            <a href=""><img class="border rounded-circle" src="/images/Lovecake.png" alt="logo"
                                            style="width: 100px; height: 80px;"></a>
                            <p class="mt-3 text-secondary">
                                Kiến thức cơ bản về đồ làm bánh 
                                Công thức hướng dẫn làm bánh
                                Công thức làm chè, kem, đồ uống
                                Làm bánh không cần lò nướng
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold text-secondary">Truy cập nhanh</h6>
                            <hr class="mb-4 mt-0 d-inline-block mx-auto"
                                style="width: 60px; background-color: #3f1b1b; height: 2px" />
                            <p>
                                <a href="#!" class="text-secondary text-decoration-none">Trang chủ</a>
                            </p>
                            <p>
                                <a href="about.jsp" class="text-secondary text-decoration-none">Giới thiệu</a>
                            </p>
                            <p>
                                <a href="#!" class="text-secondary text-decoration-none">Tin tức</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold text-secondary">Liên hệ</h6>
                            <hr class="mb-4 mt-0 d-inline-block mx-auto"
                                style="width: 60px; background-color: #3f1b1b; height: 2px" />
                            <p class="text-secondary"><i class="fas fa-home mr-3"></i> Cần Thơ</p>
                            <p class="text-secondary"><i class="fas fa-envelope mr-3"></i> lovecake@gmail.com</p>
                            <p class="text-secondary"><i class="fas fa-phone mr-3"></i> 090000000</p>
                            <p class="mt-1">
                                <!-- Facebook -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-facebook-f"></i></a>
                                <!-- Dribbble -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-instagram"></i></a>
                                <!-- Twitter -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-twitter"></i></a>
                                <!-- Google + -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-google"></i></a>
                                <!-- Linkedin -->
                            </p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: #454445">
                © 2020 Copyright:
                <a class="text-white text-decoration-none" href="https://mdbootstrap.com/">Group4</a>
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
