<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>

<body>
    <section id="admin-section">
        <div class="complains">
            <h1>Employee Complaints</h1>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Complain ID</th>
                        <th>Name</th>
                        <th>Message</th>
                        <th>Email Address</th>
                        <th>Action</th> 
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="complianTableBody">
                    <!-- Dynamic rows go here -->
                </tbody>
            </table>
        </div>
    </section>
    <script src="./jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>

    <script>
        const API_URL = 'http://localhost:8080/backend/api/v1/complains';

        $(document).ready(() => {
            getAllComplains();

            $('#complianTableBody').on('click', '.delete-btn', function () {
                const row = $(this).closest('tr');
                const id = $(this).data('id');

                if (!confirm(`Are you sure want to delete this complaint ID ${id}?`)) return;

                $.ajax({
                    url: API_URL,
                    method: 'DELETE',
                    contentType: 'application/json',
                    data: JSON.stringify({ id }),
                    success: () => {
                        row.remove();
                        console.log(`Complaint ID ${id} deleted`);
                        getAllComplains();
                    },
                    error: (err) => {
                        console.error(`Failed to delete complaint ID ${id}`, err);
                    }
                });
            });
        });

        const getAllComplains = () => {
            $.ajax({
                url: API_URL,
                method: 'GET',
                dataType: 'json',
                success: (res) => {
                    $('#complianTableBody').empty();
                    console.log("API Response:", res);

                    res.forEach(complain => {
                        console.log("Complain Entry:", complain); 

                       
                        console.log(`ID: ${complain.id}, Name: ${complain.name}, Email: ${complain.email}, Message: ${complain.message}`);

                        $('#complianTableBody').append(`
                   <tr>
        <td>${complain.id}</td>
        <td>${complain.name}</td>
        <td>${complain.message}</td>
        <td>${complain.email}</td>
        <td>
            <button class="btn btn-danger delete-btn" data-id="${complain.id}">Delete</button>
        </td>
        <td>
            <input type="checkbox" class="form-check-input">
        </td>
    </tr>
                `);
                    });
                },
                error: (err) => {
                    console.log("AJAX Error", err);
                }
            });
        };


    </script>
</body>

</html>