<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holiday Calendar</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style>
        .calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 1px;
            background-color: #f1f1f1;
            padding: 10px;
        }
        .calendar-day {
            padding: 10px;
            border: 1px solid #ddd;
            min-height: 100px;
            position: relative;
            background-color: #fff;
        }
        .calendar-day header {
            font-weight: bold;
            text-align: center;
            margin-bottom: 5px;
        }
        .holiday {
            background-color: #f9f9f9;
            border-left: 5px solid #4CAF50;
            padding: 5px;
            margin: 5px 0;
            font-size: 14px;
        }
        .holiday-list {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            z-index: 100;
            width: 100%;
            box-sizing: border-box;
        }
        .calendar-day:hover .holiday-list {
            display: block;
        }
        .month-nav {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="month-nav">
            <a href="{{ route('calendar', ['year' => $year, 'month' => str_pad($month - 1, 2, '0', STR_PAD_LEFT)]) }}">Previous</a>
            <span>{{ date('F Y', strtotime("$year-$month-01")) }}</span>
            <a href="{{ route('calendar', ['year' => $year, 'month' => str_pad($month + 1, 2, '0', STR_PAD_LEFT)]) }}">Next</a>
        </div>
        <div class="calendar">
            @foreach (range(1, 7) as $dayOfWeek)
                <div class="calendar-day">
                    <header>{{ ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][$dayOfWeek - 1] }}</header>
                </div>
            @endforeach

            @php
                $firstDayOfMonth = date('Y-m-d', strtotime("$year-$month-01"));
                $lastDayOfMonth = date('Y-m-d', strtotime("$year-$month-" . date('t', strtotime($firstDayOfMonth))));
                $startDate = new \DateTime($firstDayOfMonth);
                $endDate = new \DateTime($lastDayOfMonth);
            @endphp

            @for ($i = 0; $i < $startDate->format('N') - 1; $i++)
                <div class="calendar-day"></div>
            @endfor

            @foreach ($calendar as $date)
                <div class="calendar-day">
                    <header>{{ date('j', strtotime($date)) }}</header>
                    @foreach ($holidays as $holiday)
                        @if ($holiday->date == $date)
                            <div class="holiday">
                                <strong>{{ $holiday->name }}</strong><br>
                                {{ $holiday->type }}
                            </div>
                        @endif
                    @endforeach
                </div>
            @endforeach

            @for ($i = $endDate->format('N'); $i < 7; $i++)
                <div class="calendar-day"></div>
            @endfor
        </div>
    </div>
</body>
</html>
