<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    
</head>

<body>
    <h5 id="empEmail"></h5>

    <h1 id="title">Inform a New Complain</h1>

    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label"> Name</label>
        <input type="text" class="form-control" id="name" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Enter Your Complain</label>
        <input type="text" class="form-control" id="message" aria-describedby="emailHelp">
    </div>

    <button id="sendComplain" class="btn btn-primary">Send</button>

    <h1>My Complains</h1>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Complain ID</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody id="complianTableBody">
            <!-- Dynamic rows go here -->
        </tbody>
    </table>

    <script src="./jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            const email = localStorage.getItem('empEmail');
            if (email) {
                $('#empEmail').text(email);
            } else {
                $('#empEmail').text('No email found');
            }
            getAllComplains();
        });

        const getAllComplains = () => {
            const email = $('#empEmail').text().trim();

            if (!email || email === 'No email found') {
                console.error("Email not set.");
                return;
            }

            $.ajax({
                url: 'http://localhost:8080/backend/api/v1/getComplainByEmail',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ email: email }),
                success: (data) => {
                    console.log(data);
                    $('#complianTableBody').empty();

                    if (data.length === 0) {
                        $('#complianTableBody').append(`<tr><td colspan="2">No complaints found.</td></tr>`);
                    } else {
                        data.forEach((complain) => {
                            $('#complianTableBody').append(`
                        <tr>
                            <td>${complain.id}</td>
                            <td>${complain.message}</td>
                        </tr>
                    `);
                        });
                    }
                },

                error: (err) => {
                    console.error(err);
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Failed to load complaints!"
                    });
                }
            });
        }

        $('#sendComplain').on('click', () => {
            const apiURL = 'http://localhost:8080/backend/api/v1/complains'
            const complain = {
                name: $('#name').val(),
                email: $('#empEmail').text().trim(),
                message: $('#message').val(),
            }
            $.ajax({
                url: apiURL,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(complain),
                success: (data) => {
                    console.log(data);
                    getAllComplains();
                },
                error: (err) => {
                    console.error(err);
                }
            })
        })

    </script>
</body>

</html>