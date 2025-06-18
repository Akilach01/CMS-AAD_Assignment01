<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>

<body>
    <div class="form">
        <h1>Create a New Account</h1>
        <div class="mb-3">
            <label for="inputName" class="form-label"> Name</label>
            <input type="text" class="form-control" id="name" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="inputEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="inputPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" aria-describedby="emailHelp">
        </div>
        <button class="btn btn-primary" id="userRegisterBtn">Create Account</button>
        <div class="lst">
            <label for="inputBtn">already have an account ?</label>
            <a href="./index.jsp">Sign in</a>
        </div>
    </div>


    <script src="./jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>

    <script>
        $('#userRegisterBtn').on('click', () => {

            const API_URL = 'http://localhost:8080/backend/api/v1/admin'

            const admin = {
                name: $('#name').val(),
                email: $('#email').val(),
                password: $('#password').val()
            }

            $.ajax({
                url: API_URL,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(admin),
                success: (res) => {
                    console.log(res);
                    fieldsCler()
                    Swal.fire({
                        title: "successful!",
                        text: "Account Created !",
                        icon: "success"
                    });
                    window.location.href = './index.jsp'
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

        const fieldsCler = () => {
            $('#name').val('')
            $('#email').val('')
            $('#password').val('')
        }
    </script>
</body>

</html>
