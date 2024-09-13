<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yearly Holiday Calendar</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style>
        /* Basic styling for year view */
        .year-calendar {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }
        .month {
            border: 1px solid #ddd;
            padding: 10px;
            min-height: 300px;
        }
        .month-name {
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }
        .calendar-day {
            border: 1px solid #ddd;
            padding: 5px;
            display: inline-block;
            width: 30px;
            text-align: center;
            position: relative;
        }
        .holiday-list {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 5px;
            z-index: 100;
            width: 100%;
            box-sizing: border-box;
        }
        .calendar-day:hover .holiday-list {
            display: block;
        }
        .default-holiday {
            background-color: #e0f7fa;
            border: 1px solid #00796b;
            padding: 5px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Yearly Holiday Calendar for {{ $year }}</h1>
        <div class="year-calendar">
            @for ($month = 1; $month <= 12; $month++)
                <div class="month">
                    <div class="month-name">{{ DateTime::createFromFormat('!m', $month)->format('F') }}</div>
                    @for ($day = 1; $day <= 31; $day++)
                        @php
                            $date = \Carbon\Carbon::create($year, $month, $day);
                            $dayHolidays = $holidays->filter(function ($holiday) use ($date) {
                                return $holiday->date->isSameDay($date);
                            });
                            $defaultHoliday = $dayHolidays->first();
                        @endphp
                        @if ($date->format('j') == $day)
                            <div class="calendar-day">
                                <strong>{{ $day }}</strong>
                                @if ($defaultHoliday)
                                    <div class="default-holiday">
                                        <strong>{{ $defaultHoliday->name }}</strong><br>
                                        {{ $defaultHoliday->type }}
                                    </div>
                                @endif
                                <div class="holiday-list">
                                    @foreach ($dayHolidays as $holiday)
                                        <div class="holiday">
                                            <strong>{{ $holiday->name }}</strong><br>
                                            {{ $holiday->type }}
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif
                    @endfor
                </div>
            @endfor
        </div>
    </div>
</body>
</html>
