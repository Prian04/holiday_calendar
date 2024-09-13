<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Holiday Calendar</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>

    <h3 class="text-center my-2">All Country Holiday Calendar</h3>
<div id="holiday-fetch" class="text-center">
    <form id="fetch-form">
        <label for="country">Country Code:</label>
        <input type="text" id="country" name="country" required>

        <label for="year">Year:</label>
        <input type="number" id="year" name="year" required>

        <button type="submit" class="btn btn-primary mx-2">Fetch Holidays</button>
    </form>
</div>
<a href="{{ route('calendar') }}" class="btn btn-primary my-4 ">View Calendar</a>

<div id="holiday-calendar">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Date</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="holiday-list">
      
        </tbody>
    </table>
</div>
<!-- modal -->
<div class="modal fade" id="editHolidayModal" tabindex="-1" role="dialog" aria-labelledby="editHolidayModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editHolidayModalLabel">Edit Holiday</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editHolidayForm">
                    @csrf
                    @method('PUT')
                    <input type="hidden" id="holidayId">
                    <div class="form-group">
                        <label for="editName">Name:</label>
                        <input type="text" class="form-control" id="editName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="editDate">Date:</label>
                        <input type="date" class="form-control" id="editDate" name="date" required>
                    </div>
                    <div class="form-group">
                        <label for="editType">Type:</label>
                        <input type="text" class="form-control" id="editType" name="type" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Holiday</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
     $(document).ready(function () {
            fetchHolidays();
        });

</script>
<script >
    // Fetch and display holidays from database
    function fetchHolidays() {
        console.log("data");
        $.ajax({
            url: '{{ route('holidays.fetch') }}',
            method: 'GET',
            success: function (data) {
                let html = '';
                console.log(data);
                
                    data.forEach(function (holiday) {
                        html += `<tr>
                            <td>${holiday.name}</td>
                            <td>${holiday.date}</td>
                            <td>${holiday.type}</td>
                            <td>
                                <button class="edit" data-id="${holiday.id}">Edit</button>
                                <button class="delete" data-id="${holiday.id}">Delete</button>
                            </td>
                        </tr>`;
                    });
               

                    $('#holiday-list').html(html);
            }
        });
    }

    // Fetch holidays  from api
    $('#fetch-form').on('submit', function (e) {
        e.preventDefault();

          let country = encodeURIComponent($('#country').val());
    let year = encodeURIComponent($('#year').val());

        $.ajax({
            url: `/holidays/fetch/${country}/${year}`,
            method: 'GET',
            success: function (response) {
                alert(response.message);
                fetchHolidays();
            },
            error: function (xhr) {
                alert('Error fetching holidays');
            }
        });
    });


    $(document).on('click', '.delete', function () {
        let id = $(this).data('id');
        let token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            url: `/holidays/${id}`,
            method: 'DELETE',
             data: {
            _token: token 
            },
            success: function (response) {
                console.log(response); // Log the entire response object
            if (response.success) {
                fetchHolidays(); // Refresh the list of holidays
                alert(response.message); // Show success message
            } else {
                alert(response.message); // Show error message
            }
                
            },
            error: function (xhr, status, error) {
            console.log(xhr.responseText);
            alert('An error occurred while deleting the holiday.');
            }
        });
    });


    $(document).on('click', '.edit', function () {
    let id = $(this).data('id');

        $.ajax({
            url: `/holidays/${id}/edit`,
            method: 'GET',
            success: function (response) {
                console.log("edit working");
                if (response.success) {
                    $('#holidayId').val(response.id);
                    $('#editName').val(response.name);
                    $('#editDate').val(response.date);
                    $('#editType').val(response.type);
                    $('#editHolidayModal').modal('show');
                } else {
                    alert(response.message);
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    });
    

    $('#editHolidayForm').on('submit', function (e) {
        e.preventDefault();

        let id = $('#holidayId').val();
        let token = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            url: `/holidays/${id}`,
            method: 'PUT',
            data: {
                _token: token,
                name: $('#editName').val(),
                date: $('#editDate').val(),
                type: $('#editType').val()
            },
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    fetchHolidays();
                    $('#editHolidayModal').modal('hide');
                } else {
                    alert(response.message);
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    });
</script>
</body>
</html>