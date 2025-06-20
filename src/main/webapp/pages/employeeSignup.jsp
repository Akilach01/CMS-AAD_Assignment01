<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee-Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>

<body>

    <div class="form">
        <h1>Create a Employee Account</h1>
        <div class="mb-3">
            <label for="" class="form-label"> Employee ID</label>
            <input type="text" class="form-control" id="id" aria-describedby="emailHelp">
        </div>

        <div class="mb-3">
            <label for="" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" aria-describedby="emailHelp">
        </div>

        <div class="mb-3">
            <label for="" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" aria-describedby="emailHelp">
        </div>

        <div class="mb-3">
            <label for="" class="form-label">Contact No.</label>
            <input type="text" class="form-control" id="contact" aria-describedby="emailHelp">
        </div>
        <button class="btn btn-primary" id="empRegisterBtn">Create Account</button>
        <a href="./index.jsp" style="margin-top: 15px;">back to home</a>
    </div>

    <script src="./jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $('#empRegisterBtn').on('click', () => {

            const API_URL = 'http://localhost:8080/CMS-AAD_Assignment01/api/v1/employee';

            const employee = {
                id: $('#id').val(),
                name: $('#name').val(),
                email: $('#email').val(),
                contact: $('#contact').val()
            }

            $.ajax({
                url: API_URL,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(employee),
                success: (res) => {
                    console.log(res);
                    Swal.fire({
                        title: "Successful!",
                        text: "Employee Account Created !",
                        icon: "success"
                    });
                    window.location.href = './empsignin.jsp'
                    clearFields()
                },
                error: (err) => {
                    console.log(err);
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Something went wrong!"
                    });
                }
            })
        })

        const clearFields = () => {
            $('#id').val('')
            $('#name').val('')
            $('#email').val('')
            $('#contact').val('')
        }
    </script>
</body>

</html>