<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>

<body>

    <div class="form">
        <h1>Welcome To Complain Management System !</h1>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email </label>
            <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" id="password">
        </div>
        <button type="submit" class="btn btn-primary" id="loginBtn">Goto Admin Dashboard</button>
        <div class="lst">
            <label for="">Don't have an account ?</label>
            <a href="adminSignup.jsp">sign up </a>
        </div>
        <div class="employee">
            <label for="">Are you an employee ?</label>
            <a href="./empsignin.jsp">Sign in as a Employee</a">
        </div>
    </div>

    <!-- JQuerry.js File -->
    <script src="./jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>

    <script>
        $('#loginBtn').on('click', () => {

            const API_URL = 'http://localhost:8080/backend/api/v1/admin/signin'
            const loginData = {
                email: $('#email').val(),
                password: $('#password').val()
            }

            $.ajax({
                url: API_URL,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(loginData),
                success: (res) => {
                    console.log(res);
                    clearFields()
                    window.location.href = 'adminDashboard.jsp'
                },
                error: (err) => {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Something went wrong!"
                    });
                    console.log(err);
                }
            })
        })

        const clearFields = () => {
            $('#email').val('')
            $('#password').val('')
        }
    </script>
</body>

</html>